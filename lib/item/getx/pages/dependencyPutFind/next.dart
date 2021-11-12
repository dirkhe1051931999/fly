import 'package:flutter/material.dart';
import 'package:fly/item/getx/pages/dependencyPutFind/controller.dart';
import 'package:get/get.dart';

class NextPageView extends StatelessWidget {
  NextPageView({Key? key}) : super(key: key);
  final controller = Get.find<dependencyPutFindController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NextPage"),
      ),
      body: Center(
        child: Column(
          children: [
            GetX<dependencyPutFindController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                return Text('count -> ${_.count}');
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
