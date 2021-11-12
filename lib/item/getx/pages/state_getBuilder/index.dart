import 'package:flutter/material.dart';
import 'package:fly/item/getx/pages/state_getBuilder/controller.dart';
import 'package:get/get.dart';

class StateGetBuilderView extends StatelessWidget {
  StateGetBuilderView({Key? key}) : super(key: key);
  final controller = stateGetBuilderCountController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetBuilder"),
      ),
      body: Center(
        child: Column(
          children: [
            GetBuilder<stateGetBuilderCountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                return Text('no id value-> ${_.count}');
              },
            ),
            GetBuilder<stateGetBuilderCountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                return Text('no id value-> ${_.count2}');
              },
            ),
            GetBuilder<stateGetBuilderCountController>(
              id: 'add2',
              init: controller,
              initState: (_) {},
              builder: (_) {
                return Text('have id value-> ${_.count}');
              },
            ),
            const Divider(),
            GetBuilder<stateGetBuilderCountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        _.add();
                      },
                      child:
                          const Text('stateGetBuilderCountController _.add()'),
                    )
                  ],
                );
              },
            ),
            GetBuilder<stateGetBuilderCountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        _.add2();
                      },
                      child:
                          const Text('stateGetBuilderCountController _.add2()'),
                    )
                  ],
                );
              },
            ),
            InkWell(
              onTap: () {
                controller.update();
              },
              child: const Text('update all'),
            ),
            InkWell(
              onTap: () {
                controller.update(['add2']);
              },
              child: const Text('update count2'),
            ),
          ],
        ),
      ),
    );
  }
}
