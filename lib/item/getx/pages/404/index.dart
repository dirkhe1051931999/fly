import 'package:flutter/material.dart';
import 'package:fly/item/getx/common/routes/app_pages.dart';
import 'package:get/get.dart';

class NotfoundView extends StatelessWidget {
  const NotfoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("路由没有找到"),
      ),
      body: ListTile(
        title: const Text("返回首页"),
        subtitle: const Text('Get.offAllNamed(AppRoutes.Home)'),
        onTap: () => Get.offAllNamed(AppRoutes.home),
      ),
    );
  }
}
