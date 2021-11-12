import 'package:flutter/material.dart';
import 'package:fly/item/getx/common/routes/app_pages.dart';
import 'package:get/get.dart';

class GetxView extends StatelessWidget {
  const GetxView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unknownRoute,
    );
  }
}
