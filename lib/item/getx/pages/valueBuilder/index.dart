import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateValueBuilderView extends StatelessWidget {
  const StateValueBuilderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ValueBuilder"),
      ),
      body: Column(
        children: [
          Center(
            child: ValueBuilder<int?>(
              initialValue: 10,
              builder: (value, updateFn) {
                return Column(
                  children: [
                    Text('count->' + value.toString()),
                    InkWell(
                      onTap: () {
                        updateFn(value! + 1);
                      },
                      child: const Text('ValueBuilder value+ 1'),
                    )
                  ],
                );
              },
              onUpdate: (value) => print("Value updated: $value"),
              onDispose: () => print("Widget unmounted"),
            ),
          ),
        ],
      ),
    );
  }
}
