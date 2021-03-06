import 'package:flutter/material.dart';
import 'package:subbu_portfolio/presentation/pages/about/about_page.dart';
import 'package:subbu_portfolio/presentation/pages/certification/certification_page.dart';
import 'package:subbu_portfolio/presentation/pages/experience/experience_page.dart';
import 'package:subbu_portfolio/presentation/pages/home/home_page.dart';
import 'package:subbu_portfolio/presentation/pages/my_thought/my_thought.dart';
import 'package:subbu_portfolio/presentation/pages/portfolio/portfolio_page.dart';
import 'package:subbu_portfolio/presentation/pages/project_detail/project_detail.dart';

typedef PathWidgetBuilder = Widget Function(
    BuildContext, String? /*Map<String, String>*/);

class Path {
  const Path(this.pattern, this.builder);

  /// A RegEx string for route matching.
  final String pattern;

  /// The builder for the associated pattern route. The first argument is the
  /// [BuildContext] and the second argument is any RegEx matches if such are
  /// included inside of the pattern. See example:
  ///
  /// ```dart
  /// Path(
  ///   'r'^/demo/(?<slug>[\w-]+)$',
  ///   (context, matches) => Page(argument: matches['slug']),
  /// )
  /// ```
  final PathWidgetBuilder builder;
}

class RouteConfiguration {
  /// List of [Path] to for route matching. When a named route is pushed with
  /// [Navigator.pushNamed], the route name is matched with the [Path.pattern]
  /// in the list below. As soon as there is a match, the associated builder
  /// will be returned. This means that the paths higher up in the list will
  /// take priority.
  static List<Path> paths = [
    Path(
      r'^' + AboutPage.routeName,
      (context, matches) => const AboutPage(),
    ),
//    Path(
//      r'^' + ContactPage.contactPageRoute,
//      (context, matches) => const ContactPage(),
//    ),
    Path(
      r'^' + MyThoughtPage.routeName,
      (context, matches) => const MyThoughtPage(),
    ),
    Path(
      r'^' + PortfolioPage.routeName,
      (context, matches) => const PortfolioPage(),
    ),
    Path(
      r'^' + ProjectDetailPage.routeName,
      (context, matches) => const ProjectDetailPage(),
    ),
    Path(
      r'^' + ExperiencePage.routeName,
      (context, matches) => const ExperiencePage(),
    ),
    Path(
      r'^' + CertificationPage.routeName,
      (context, matches) => const CertificationPage(),
    ),
    Path(
      r'^' + HomePage.routeName,
      (context, matches) => const HomePage(),
    ),
  ];

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    for (Path path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name!)) {
        final firstMatch = regExpPattern.firstMatch(settings.name!)!;
        final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;
        return NoAnimationMaterialPageRoute<void>(
          builder: (context) => path.builder(context, match),
          settings: settings,
        );
      }
    }
    return null;
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
