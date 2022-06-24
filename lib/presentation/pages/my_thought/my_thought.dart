import 'package:flutter/material.dart';
import 'package:subbu_portfolio/presentation/pages/my_thought/my_thought_desktop.dart';
import 'package:subbu_portfolio/presentation/pages/my_thought/my_thought_mobile.dart';
import 'package:subbu_portfolio/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MyThoughtPage extends StatelessWidget {
  static const String routeName = StringConst.My_Fav_Quote;
  const MyThoughtPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
          mobile: MyThoughtMobile(),
          tablet: MyThoughtDesktop(),
          desktop: MyThoughtDesktop()),
    );
  }
}
