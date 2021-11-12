import 'package:flutter/material.dart';
import 'package:fly/item/getx/pages/dependencyLazyPut/controller.dart';
import 'package:fly/item/getx/pages/dependencyLazyPut/next.dart';
import 'package:get/get.dart';

class DependencyLazyPutView extends StatelessWidget {
  const DependencyLazyPutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dependency - LazyPut"),
      ),
      body: Center(
        child: Column(
          children: [
            GetX<dependencyLazyPutController>(
              init: Get.find<dependencyLazyPutController>(),
              initState: (_) {},
              builder: (_) {
                return Text('count-> ${_.count}');
              },
            ),
            InkWell(
              onTap: () {
                Get.find<dependencyLazyPutController>().add();
              },
              child: const Text('add'),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const NextPageView());
              },
              child: const Text('next page'),
            )
          ],
        ),
      ),
    );
  }
}
