import 'package:flutter/material.dart';
import 'package:subbu_portfolio/presentation/pages/about/about_page_desktop.dart';
import 'package:subbu_portfolio/presentation/pages/about/about_page_mobile.dart';
import 'package:subbu_portfolio/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutPage extends StatelessWidget {
  static const String routeName = StringConst.ABOUT_PAGE;

  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: AboutPageMobile(),
        tablet: AboutPageDesktop(),
        desktop: AboutPageDesktop(),
      ),
    );
  }
}
