import 'package:assessment/controllers/global.dart';
import 'package:assessment/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
  Get.put(GlobalService(), permanent: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const HomeScreen(),
      initialRoute: GlobalService.to.initialRoute(),
      getPages: AppPages.pages,
    );
  }
}
