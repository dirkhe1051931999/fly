import 'package:get/get.dart';

class stateWorksController extends GetxController {
  final _count = 0.obs;
  set count(value) => _count.value = value;
  get count => _count.value;

  add() => _count.value++;

  @override
  void onInit() {
    super.onInit();
    // 每次
    ever(_count, (value) {
      print("ever -> " + value.toString());
    });
    // 第一次
    once(_count, (value) {
      print("once -> " + value.toString());
    });
    // 防抖
    debounce(_count, (value) {
      print("debounce -> " + value.toString());
    }, time: const Duration(seconds: 2));
    // 定时器
    interval(
      _count,
      (value) {
        print("interval -> " + value.toString());
      },
      time: Duration(seconds: 1),
    );
  }
}
