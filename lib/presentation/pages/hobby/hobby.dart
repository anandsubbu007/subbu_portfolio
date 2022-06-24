import 'package:flutter/material.dart';
import 'package:subbu_portfolio/presentation/pages/hobby/hobby_desktop.dart';
import 'package:subbu_portfolio/presentation/pages/hobby/hobby_mobile.dart';
import 'package:subbu_portfolio/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MyHobbyPage extends StatelessWidget {
  static const String routeName = StringConst.My_Fav_Quote;
  const MyHobbyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
          mobile: MyHobbyMobile(),
          tablet: MyHobbyDesktop(),
          desktop: MyHobbyDesktop()),
    );
  }
}
