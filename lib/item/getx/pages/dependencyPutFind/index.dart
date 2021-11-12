import 'package:flutter/material.dart';
import 'package:fly/item/getx/pages/dependencyPutFind/controller.dart';
import 'package:fly/item/getx/pages/dependencyPutFind/next.dart';
import 'package:get/get.dart';

class DependencyPutFindView extends StatelessWidget {
  DependencyPutFindView({Key? key}) : super(key: key);
  final controller =
      Get.put<dependencyPutFindController>(dependencyPutFindController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dependency"),
      ),
      body: Center(
        child: Column(
          children: [
            GetX<dependencyPutFindController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                return Text('count ${_.count}');
              },
            ),
            InkWell(
              onTap: () {
                controller.add();
              },
              child: const Text('add'),
            ),
            InkWell(
              onTap: () {
                Get.to(() => NextPageView());
              },
              child: const Text('next page'),
            )
          ],
        ),
      ),
    );
  }
}
