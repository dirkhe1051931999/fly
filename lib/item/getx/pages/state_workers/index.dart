import 'package:flutter/material.dart';
import 'package:fly/item/getx/pages/state_workers/controller.dart';
import 'package:get/get.dart';

class StateWorksView extends StatelessWidget {
  StateWorksView({Key? key}) : super(key: key);
  final controller = stateWorksController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetBuilder"),
      ),
      body: Center(
        child: Column(
          children: [
            GetX<stateWorksController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                return Text('count-> ${_.count}');
              },
            ),
            InkWell(
              onTap: () {
                controller.add();
              },
              child: const Text(' controller.add()'),
            )
          ],
        ),
      ),
    );
  }
}
