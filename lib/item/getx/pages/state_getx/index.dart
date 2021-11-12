import 'package:flutter/material.dart';
import 'package:fly/item/getx/pages/state_getx/controller.dart';
import 'package:get/get.dart';

class stateGetxView extends StatelessWidget {
  stateGetxView({Key? key}) : super(key: key);
  final controller = stateGetxCountController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('stateGetx'),
      ),
      body: Center(
        child: Column(
          children: [
            GetX<stateGetxCountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                return Text('value1->${_.count}');
              },
            ),
            GetX<stateGetxCountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                return Text('value2->${_.count}');
              },
            ),
            GetX<stateGetxCountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                return Column(
                  children: [
                    Text('value3->${_.count}'),
                    InkWell(
                      onTap: () {
                        _.add();
                      },
                      child: const Text('GetX<stateGetxCountController> add'),
                    )
                  ],
                );
              },
            ),
            GetX<stateGetxCountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                return Text('value4->${_.count2}');
              },
            ),
            InkWell(
              onTap: () {
                controller.add();
              },
              child: const Text('controller.add'),
            ),
            InkWell(
              onTap: () {
                controller.add2();
              },
              child: const Text('controller.add2'),
            )
          ],
        ),
      ),
    );
  }
}
