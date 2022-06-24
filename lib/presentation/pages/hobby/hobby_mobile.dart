import 'package:flutter/material.dart';
import 'package:subbu_portfolio/core/layout/adaptive.dart';
import 'package:subbu_portfolio/presentation/pages/about/about_page.dart';
import 'package:subbu_portfolio/presentation/pages/my_thought/my_thought_desktop.dart';
import 'package:subbu_portfolio/presentation/widgets/app_drawer.dart';
import 'package:subbu_portfolio/presentation/widgets/content_wrapper.dart';
import 'package:subbu_portfolio/presentation/widgets/custom_app_bar.dart';
import 'package:subbu_portfolio/values/data/moto.dart';
import 'package:subbu_portfolio/values/values.dart';

class MyHobbyMobile extends StatefulWidget {
  @override
  _MyHobbyMobileState createState() => _MyHobbyMobileState();
}

class _MyHobbyMobileState extends State<MyHobbyMobile>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late AnimationController _controller;
  late AnimationController _flickerAnimationController;
  late Animation<double> opacityAnimation;
  bool _isContentVisible = false;

  @override
  void initState() {
    _flickerAnimationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _playFlickerAnimation());
    initializeTweens();
    super.initState();
  }

  initializeTweens() {
    opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.easeInOutCubic),
      ),
    );
  }

  Future<void> _playFlickerAnimation() async {
    try {
      await _flickerAnimationController.forward().orCancel;
      await _flickerAnimationController.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  void dispose() {
    _flickerAnimationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: CustomAppBar(
          title: StringConst.ABOUT_ME,
          onLeadingPressed: () {
            if (_scaffoldKey.currentState!.isEndDrawerOpen) {
              _scaffoldKey.currentState!.openEndDrawer();
            } else {
              _scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
      ),
      drawer: AppDrawer(
          menuList: Data.menuList, selectedItemRouteName: AboutPage.routeName),
      body: Stack(
        children: [
          ContentWrapper(
              child: ListView.builder(
            itemCount: motos.length,
            itemBuilder: (BuildContext context, int i) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(4, 0, 100, 0),
                child: MyThoughtListTile(
                  moto: motos[i],
                  flickerController: _flickerAnimationController,
                ),
              );
            },
          )),
          _isContentVisible ? _fadeInImage() : Container(),
        ],
      ),
    );
  }

  Widget _fadeInImage() {
    return AnimatedBuilder(
      animation: _controller,
      child: Image.asset(ImagePath.DEV,
          height: heightOfScreen(context), fit: BoxFit.fitHeight),
      builder: (BuildContext context, Widget? child) {
        return Positioned(
          right: widthOfScreen(context) > 450
              ? -assignWidth(context: context, fraction: 0.2)
              : -assignWidth(context: context, fraction: 0.7),
          child: FadeTransition(opacity: opacityAnimation, child: child),
        );
      },
    );
  }
}
