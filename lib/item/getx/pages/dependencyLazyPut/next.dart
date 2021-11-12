import 'package:flutter/material.dart';
import 'package:fly/item/getx/pages/dependencyLazyPut/controller.dart';
import 'package:get/get.dart';

/// extends StatelessWidget写法
// class NextPageView extends StatelessWidget {
//   NextPageView({Key? key}) : super(key: key);
//   final controller = Get.find<dependencyLazyPutController>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("NextPage lazy"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             GetX<dependencyLazyPutController>(
//               init: controller,
//               initState: (_) {},
//               builder: (_) {
//                 return Text('count -> ${_.count}');
//               },
//             ),
//             const Divider(),
//             InkWell(
//               onTap: () {
//                 controller.add();
//               },
//               child: const Text('add'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class NextPageView extends GetView<dependencyLazyPutController> {
  const NextPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NextPage lazy"),
      ),
      body: Center(
        child: Column(
          children: [
            GetX<dependencyLazyPutController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                return Text('count -> ${_.count}');
              },
            ),
            const Divider(),
            InkWell(
              onTap: () {
                controller.add();
              },
              child: const Text('add'),
            ),
          ],
        ),
      ),
    );
  }
}
