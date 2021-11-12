import 'package:fly/item/getx/pages/dependencyLazyPut/controller.dart';
import 'package:get/get.dart';

// Get.lazyPut
// 懒加载一个依赖，只有在使用时才会被实例化。
// Get.lazyPut 注入的实例的生命周期是和在Get.find时的上下文所绑定
class DependencyLazyPutBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<dependencyLazyPutController>(
        () => dependencyLazyPutController());
    // TODO: implement dependencies
  }
}
