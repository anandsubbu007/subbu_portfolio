import 'package:flutter/material.dart';
import 'package:subbu_portfolio/presentation/pages/project_detail/project_detail_desktop.dart';
import 'package:subbu_portfolio/presentation/pages/project_detail/project_detail_mobile.dart';
import 'package:subbu_portfolio/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProjectDetailPage extends StatelessWidget {
  static const String routeName = StringConst.PROJECT_DETAIL_PAGE;
  const ProjectDetailPage({this.projectDetails, Key? key}) : super(key: key);
  final PortfolioData? projectDetails;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        body: ScreenTypeLayout(
          mobile: ProjectDetailMobile(projectDetails: projectDetails),
          tablet: ProjectDetailDesktop(projectDetails: projectDetails!),
          desktop: ProjectDetailDesktop(projectDetails: projectDetails!),
        ),
      ),
    );
  }
}
