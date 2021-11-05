/// 抽屉页渲染及回调函数
/// MyHomePage 首页，HelpScreen 帮助页，FeedbackScreen 反馈页，InviteFriend 邀请页

import 'package:flutter/material.dart';
import 'package:fly/shell/custom_drawer/drawer_user_controller.dart';
import 'package:fly/shell/custom_drawer/home_drawer.dart';
import 'package:fly/shell/pages/feedback_screen.dart';
import 'package:fly/shell/pages/help_screen.dart';
import 'package:fly/shell/pages/home_screen.dart';
import 'package:fly/shell/pages/invite_friend_screen.dart';
import 'package:fly/shell/values/app_theme.dart';

class NavigationHomeScreen extends StatefulWidget {
  const NavigationHomeScreen({Key? key}) : super(key: key);

  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    // 默认是HOME
    drawerIndex = DrawerIndex.home;
    // HOME的page
    screenView = const MyHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: /* 根据需要在导航起始屏幕（如 MyHomePage、HelpScreen、FeedbackScreen 等）上替换屏幕视图...*/
              DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
            },
            screenView: screenView,
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.home) {
        setState(() {
          screenView = const MyHomePage();
        });
      } else if (drawerIndex == DrawerIndex.help) {
        setState(() {
          screenView = const HelpScreen();
        });
      } else if (drawerIndex == DrawerIndex.feedback) {
        setState(() {
          screenView = const FeedbackScreen();
        });
      } else if (drawerIndex == DrawerIndex.invite) {
        setState(() {
          screenView = const InviteFriend();
        });
      } else {
        //do in your way......
      }
    }
  }
}
