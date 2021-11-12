import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListDetailsView extends StatelessWidget {
  const ListDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final details = Get.arguments as Map?;
    final parameters = Get.parameters;
    return Scaffold(
      appBar: AppBar(
        title: const Text('详情页'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('导航，返回'),
            subtitle: const Text('Get.back()'),
            onTap: () => Get.back(),
          ),
          _buildBackListTileRow(details),
          _buildBackListTileRow(parameters),
        ],
      ),
    );
  }
}

_buildBackListTileRow(Map? val) {
  return val == null
      ? Container()
      : ListTile(
          title: Text("传值 id = " + val["id"].toString()),
          subtitle: const Text('Get.back(result: {"success": true}'),
          onTap: () => Get.back(result: {"success": true}),
        );
}
