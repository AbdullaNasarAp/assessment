import 'package:get/get.dart';

class GlobalService extends GetxService {
  static GlobalService get to => Get.find<GlobalService>();

  String initialRoute() {
    return "/home";
  }
}
