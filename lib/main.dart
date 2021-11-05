import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:fly/shell/navigation_home_screen.dart';
import 'package:fly/shell/values/app_theme.dart';

void main() async {
  // 是把Widget和Flutter绑定在一起的意思
  WidgetsFlutterBinding.ensureInitialized();
  // 指定应用程序界面可以显示的方向集。设置横竖屏
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 用来设置状态栏顶部和底部样式，默认有 light 和 dark 模式，也可以按照需求自定义样式；
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // 顶部状态栏颜色
      statusBarColor: Colors.transparent,
      // 顶部状态栏图标的亮度
      statusBarIconBrightness: Brightness.dark,
      // 仅用于 iOS 设备顶部状态栏亮度
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      // 底部状态栏颜色
      systemNavigationBarColor: Colors.grey.withOpacity(0.5),
      // 底部状态栏与主内容分割线颜色
      systemNavigationBarDividerColor: Colors.transparent,
      // 底部状态栏图标样式
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      // 用于为用户标识应用程序的单行描述
      title: 'Flutter UI',
      // 横幅以指示应用程序处于调试模式
      debugShowCheckedModeBanner: false,
      // 此应用的材质小部件的默认视觉属性，例如颜色字体
      theme: ThemeData(
        // primarySwatch是不是一个Color。它是MaterialColor。这意味着材质应用程序将使用不同深浅的颜色
        primarySwatch: Colors.blue,
        // Material design 文字 theme
        textTheme: AppTheme.textTheme,
        // 材料小部件应适应目标的平台。
        platform: TargetPlatform.iOS,
      ),
      // 应用程序默认路由的小部件
      home: const NavigationHomeScreen(),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
