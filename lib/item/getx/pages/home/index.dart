import 'package:flutter/material.dart';
import 'package:fly/item/getx/common/routes/app_pages.dart';
import 'package:fly/item/getx/pages/list_details.dart/index.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('首页'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text("导航-命名路由 home > list"),
            subtitle: const Text('Get.toNamed("/home/list")'),
            onTap: () => Get.toNamed("/home/list"),
          ),
          ListTile(
            title: const Text("导航-命名路由 home > list > listDetail"),
            subtitle: const Text('Get.toNamed("/home/list/listDetails")'),
            onTap: () => Get.toNamed("/home/list/listDetails"),
          ),
          ListTile(
            title: const Text("导航-类对象"),
            subtitle: const Text("Get.to(ListDetailsView())"),
            onTap: () => Get.to(() => const ListDetailsView()),
          ),
          ListTile(
            title: const Text("导航-清除上一个路由"),
            subtitle: const Text("Get.off(ListDetailsView())"),
            onTap: () => Get.off(() => const ListDetailsView()),
          ),
          ListTile(
            title: const Text("导航-清除所有"),
            subtitle: const Text("Get.offAll(ListDetailsView())"),
            onTap: () => Get.offAll(() => const ListDetailsView()),
          ),
          ListTile(
            title: const Text("导航-arguments传值+返回值"),
            subtitle: const Text(
                'Get.toNamed("/home/list/listDetails", arguments: {"id": 999})'),
            onTap: () async {
              var result = await Get.toNamed("/home/list/listDetails",
                  arguments: {"id": 999});
              try {
                Get.snackbar(
                    "返回值", "success -> " + result["success"].toString());
              } catch (e) {
                return;
              }
            },
          ),
          ListTile(
            title: const Text("导航-parameters传值+返回值"),
            subtitle: const Text(
              'Get.toNamed("/home/list/listDetails?id=666")',
            ),
            onTap: () async {
              var result = await Get.toNamed("/home/list/listDetails?id=666");
              try {
                Get.snackbar(
                    "返回值", "success -> " + result["success"].toString());
              } catch (e) {
                return;
              }
            },
          ),
          ListTile(
            title: const Text("导航-参数传值+返回值"),
            subtitle: const Text(
                'Get.toNamed("/home/list/listDetailsDynamicId/777")'),
            onTap: () async {
              var result =
                  await Get.toNamed("/home/list/listDetailsDynamicId/777");
              try {
                Get.snackbar(
                    "返回值", "success -> " + result["success"].toString());
              } catch (e) {
                return;
              }
            },
          ),
          ListTile(
            title: const Text("导航-中间件-认证Auth"),
            subtitle: const Text('Get.toNamed("/my")'),
            onTap: () => Get.toNamed('/my'),
          ),
          const Divider(),
          ListTile(
            title: const Text("stateObx"),
            subtitle: const Text('Get.toNamed("/home/stateObx")'),
            onTap: () => Get.toNamed('/home/stateObx'),
          ),
          ListTile(
            title: const Text("stateGetx"),
            subtitle: const Text('Get.toNamed("/home/stateGetx")'),
            onTap: () => Get.toNamed('/home/stateGetx'),
          ),
        ],
      ),
    );
  }
}
