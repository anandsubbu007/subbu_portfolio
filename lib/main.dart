import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:subbu_portfolio/presentation/pages/portfolio/portfolio_page.dart';
import 'package:subbu_portfolio/values/app_const/app_theme.dart';
import 'package:subbu_portfolio/presentation/pages/home/home_page.dart';
import 'package:subbu_portfolio/presentation/routes/routes.dart';
import 'package:subbu_portfolio/values/values.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: StringConst.APP_TITLE,
        theme: AppTheme.lightThemeData,
        debugShowCheckedModeBanner: false,
        // initialRoute: PortfolioPage.routeName,
        initialRoute: HomePage.routeName,
        onGenerateRoute: RouteConfiguration.onGenerateRoute);
  }
}
