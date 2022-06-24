import 'package:flutter/material.dart';
import 'package:subbu_portfolio/core/layout/adaptive.dart';
import 'package:subbu_portfolio/presentation/pages/my_thought/my_thought.dart';
import 'package:subbu_portfolio/presentation/pages/portfolio/portfolio_page.dart';
import 'package:subbu_portfolio/presentation/widgets/content_wrapper.dart';
import 'package:subbu_portfolio/presentation/widgets/flicker_text_animation.dart';
import 'package:subbu_portfolio/presentation/widgets/menu_list.dart';
import 'package:subbu_portfolio/presentation/widgets/spaces.dart';
import 'package:subbu_portfolio/presentation/widgets/trailing_info.dart';
import 'package:subbu_portfolio/values/data/moto.dart';
import 'package:subbu_portfolio/values/values.dart';

class MyHobbyDesktop extends StatefulWidget {
  @override
  _MyHobbyDesktopState createState() => _MyHobbyDesktopState();
}

class _MyHobbyDesktopState extends State<MyHobbyDesktop>
    with TickerProviderStateMixin {
  double? widthOfImage;
  late AnimationController _controller;
  late AnimationController _flickerAnimationController;
  // late AnimationController _subtitleDevAnimationController;
  late Animation<double> widthOfLeftSide;
  late Animation<double> widthOfRightSide;
  late Animation<double> widthOfAboutContent;
  late Animation<double> heightPositionOfImage;
  late Animation<double> widthPositionOfImage;
  // late Animation<double> aboutDevAnimation;
  late Animation<double> scale;
  bool _isAboutContentVisible = false;
  // bool _visible = false;
  // bool _isSubtitleVisible = false;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _flickerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    // _flickerAnimationController2 = AnimationController(
    //   duration: const Duration(milliseconds: 300),
    //   vsync: this,
    // );
    // _subtitleDevAnimationController = AnimationController(
    //   duration: const Duration(milliseconds: 300),
    //   vsync: this,
    // );
    initializeTweens();
    _playAnimation();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isAboutContentVisible = true;
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _playFlickerAnimation();
        });
      }
    });

    // _flickerAnimationController.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _visible = true;
    //     setState(() => _isSubtitleVisible = true);
    //     // WidgetsBinding.instance.addPostFrameCallback((_) {
    //     //   _playFlickerAnimation2();
    //     // });
    //     WidgetsBinding.instance.addPostFrameCallback((_) {
    //       _playAboutDevAnimation();
    //     });
    //   }
    // });

    // _flickerAnimationController2.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     setState(() => _visible = true);
    //     WidgetsBinding.instance.addPostFrameCallback((_) {
    //       _playAboutDevAnimation();
    //     });
    //   }
    // });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _flickerAnimationController.dispose();
    super.dispose();
  }

  initializeTweens() {
    widthOfLeftSide = Tween<double>(begin: 0.5, end: 0.3).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 1.0, curve: Curves.easeInOutCubic),
      ),
    );
    widthOfRightSide = Tween<double>(begin: 0.5, end: 0.7).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 1.0, curve: Curves.easeInOutCubic),
      ),
    );
    widthOfAboutContent = Tween<double>(begin: 0.4, end: 0.6).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 1.0, curve: Curves.easeInOutCubic),
      ),
    );
    widthPositionOfImage = Tween<double>(begin: 0.5, end: 0.3).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 1.0, curve: Curves.easeInOutCubic),
      ),
    );
    heightPositionOfImage = Tween<double>(begin: 0.4, end: 0.05).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 1.0, curve: Curves.easeInOutCubic),
      ),
    );
    scale = Tween<double>(begin: 1.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 1.0, curve: Curves.easeInOutCubic),
      ),
    );
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Future<void> _playFlickerAnimation() async {
    try {
      await _flickerAnimationController.forward().orCancel;
      await _flickerAnimationController.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    double heightOfImage = assignHeight(context: context, fraction: 1);

    widthOfImage = isDisplaySmallDesktopOrIpadPro(context)
        ? 0.2
        : assignWidth(context: context, fraction: 0.4);
    return Stack(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ContentWrapper(
                    width: assignWidth(
                        context: context, fraction: widthOfLeftSide.value),
                    color: AppColors.primaryColor,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: Sizes.MARGIN_20,
                          top: Sizes.MARGIN_20,
                          bottom: Sizes.MARGIN_20),
                      child: MenuList(
                          menuList: Data.menuList,
                          selectedItemRouteName: MyThoughtPage.routeName),
                    ),
                  ),
                  ContentWrapper(
                    width: assignWidth(
                        context: context, fraction: widthOfRightSide.value),
                    color: AppColors.secondaryColor,
                    child: Row(
                      children: [
                        Container(
                          width: assignWidth(
                              context: context,
                              fraction: widthOfAboutContent.value),
                          child: _isAboutContentVisible
                              ? aboutPageContent()
                              : Container(),
                        ),
                        SizedBox(
                          width: assignWidth(context: context, fraction: 0.025),
                        ),
                        TrailingInfo(
                          width: assignWidth(context: context, fraction: 0.075),
                          onTrailingWidgetPressed: () => Navigator.pushNamed(
                              context, PortfolioPage.routeName),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Transform.translate(
          offset: Offset(
              assignWidth(
                      context: context, fraction: widthPositionOfImage.value) -
                  widthOfImage! / 2,
              assignHeight(
                  context: context, fraction: heightPositionOfImage.value)),
          child: Transform.scale(
            scale: scale.value,
            child: isDisplaySmallDesktopOrIpadPro(context)
                ? Container(width: widthOfImage)
                : Container(
                    child: Image.asset(ImagePath.DEV,
                        width: widthOfImage,
                        height: heightOfImage,
                        fit: BoxFit.scaleDown),
                  ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(
          builder: _buildAnimation,
          animation: _controller.view,
        ),
      ),
    );
  }

  Widget aboutPageContent() {
    return Container(
      padding: EdgeInsets.only(
        left: (widthOfImage! / 2) + 20,
        top: isDisplaySmallDesktopOrIpadPro(context)
            ? assignHeight(context: context, fraction: 0.05)
            : assignHeight(context: context, fraction: 0.12),
      ),
      child: ListView.builder(
        itemCount: motos.length,
        itemBuilder: (BuildContext context, int i) {
          return MyThoughtListTile(
              moto: motos[i], flickerController: _flickerAnimationController);
        },
      ),
    );
  }
}

class MyThoughtListTile extends StatefulWidget {
  final Moto moto;
  final AnimationController flickerController;
  const MyThoughtListTile(
      {Key? key, required this.moto, required this.flickerController})
      : super(key: key);

  @override
  State<MyThoughtListTile> createState() => _MyThoughtListTileState();
}

class _MyThoughtListTileState extends State<MyThoughtListTile>
    with TickerProviderStateMixin {
  late AnimationController motoController;
  bool isSubtitleVisible = false;
  late Animation<double> aboutDevAnimation;
  bool _visible = false;
  @override
  void initState() {
    super.initState();
    motoController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    widget.flickerController.addStatusListener((status) {
      if (status != AnimationStatus.forward &&
          status != AnimationStatus.reverse) {
        setState(() => _visible = true);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _playAboutDevAnimation();
        });
      }
    });
    aboutDevAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: motoController,
        curve: Interval(0.0, 1.0, curve: Curves.easeInOutCubic),
      ),
    );
  }

  @override
  void dispose() {
    motoController.dispose();
    super.dispose();
  }

  Future<void> _playAboutDevAnimation() async {
    try {
      await motoController.forward().orCancel;
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FlickerTextAnimation(
            text: widget.moto.situation,
            textColor: AppColors.primaryColor,
            fadeInColor: AppColors.primaryColor,
            controller: widget.flickerController.view,
            textStyle: theme.textTheme.headline6!.copyWith(
              fontSize: Sizes.TEXT_SIZE_22,
              fontWeight: FontWeight.w600,
              color: AppColors.accentColor2,
            ),
          ),
          SpaceH4(),
          AnimatedOpacity(
            opacity: _visible ? aboutDevAnimation.value : 0,
            duration: motoController.duration!,
            child: Text(
              "    " + widget.moto.moto,
              style: theme.textTheme.bodyText2!.copyWith(
                  color: AppColors.black, fontSize: Sizes.TEXT_SIZE_16),
            ),
          ),
          SpaceH4(),
          AnimatedOpacity(
            opacity: _visible ? aboutDevAnimation.value : 0,
            duration: motoController.duration!,
            child: Text(
              "     (" + widget.moto.motoEnglish + ')',
              style: theme.textTheme.bodyText2!.copyWith(
                color: AppColors.black,
                fontSize: Sizes.TEXT_SIZE_16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
