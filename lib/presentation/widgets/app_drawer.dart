import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:subbu_portfolio/core/layout/adaptive.dart';
import 'package:subbu_portfolio/core/utils/functions.dart';
import 'package:subbu_portfolio/presentation/widgets/circular_container.dart';
import 'package:subbu_portfolio/presentation/widgets/socials.dart';
import 'package:subbu_portfolio/presentation/widgets/spaces.dart';
import 'package:subbu_portfolio/values/values.dart';
import 'menu_item.dart' as m;

class AppDrawer extends StatelessWidget {
  AppDrawer({
    required this.menuList,
    this.color = AppColors.secondaryColor,
    this.width,
    this.selectedItemRouteName,
    this.onClose,
  });

  final Color color;
  final double? width;
  final String? selectedItemRouteName;
  final List<MenuData> menuList;
  final GestureTapCallback? onClose;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      color: color,
      width: width ??
          assignWidth(
            context: context,
            fraction: 0.65,
          ), //widthOfScreen(context),
      child: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(Sizes.PADDING_16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: onClose ??
                        () {
                          Navigator.pop(context);
                        },
                    child: CircularContainer(
                      color: AppColors.accentColor2,
                      width: Sizes.WIDTH_30,
                      height: Sizes.HEIGHT_30,
                      child: Icon(
                        Icons.close,
                        size: Sizes.ICON_SIZE_20,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ..._buildMenuList(menuList: menuList, context: context),
              ],
            ),
            Spacer(flex: 1),
            Socials(
              isHorizontal: true,
              color: AppColors.accentColor2,
              alignment: Alignment.center,
              barColor: AppColors.accentColor2,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            SpaceH16(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringConst.DESIGNED_IN,
                  style: theme.textTheme.bodyText1!.copyWith(
                    color: AppColors.accentColor2,
                    fontSize: Sizes.TEXT_SIZE_10,
                  ),
                ),
                SpaceW4(),
                Icon(
                  FontAwesomeIcons.solidHeart,
                  color: Colors.red,
                  size: Sizes.ICON_SIZE_10,
                )
              ],
            ),
            BuildWithWidget(color: AppColors.accentColor2),
            SpaceH16(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildMenuList({
    required BuildContext context,
    required List<MenuData> menuList,
  }) {
    List<Widget> menuItems = [];
    for (var i = 0; i < menuList.length; i++) {
      menuItems.add(
        m.MenuItem(
          onTap: () {
            if (menuList[i].title == StringConst.RESUME) {
              Functions.launchUrl(DocumentPath.CV);
            } else if (menuList[i].title == StringConst.CONTACT) {
              Functions.launchUrl(StringConst.EMAIL_URL);
            } else {
              Navigator.of(context).pushNamed(menuList[i].routeName);
            }
          },
          title: menuList[i].title,
          isMobile: true,
          selected:
              selectedItemRouteName == menuList[i].routeName ? true : false,
        ),
      );
      menuItems.add(SpaceH16());
    }
    return menuItems;
  }
}

class BuildWithWidget extends StatelessWidget {
  final Color color;
  const BuildWithWidget({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringConst.BUILT_WITH,
          style: theme.textTheme.bodyText1!.copyWith(
            color: color,
            fontSize: Sizes.TEXT_SIZE_10,
          ),
        ),
        SpaceH2(),
        FlutterLogo(),
        SpaceH2(),
        Text(
          ' with ',
          style: theme.textTheme.bodyText1!.copyWith(
            color: color,
            fontSize: Sizes.TEXT_SIZE_10,
          ),
        ),
        SpaceH2(),
        Icon(
          FontAwesomeIcons.solidHeart,
          color: Colors.red,
          size: Sizes.ICON_SIZE_12,
        )
      ],
    );
  }
}
