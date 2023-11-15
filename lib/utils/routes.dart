import 'package:assessment/binding/home_binding.dart';
import 'package:assessment/view/bottom_nav.dart';
import 'package:get/get.dart';

class Routes {
  Routes._();
  static const String home = '/home';
}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.home,
      page: () => const BottomNav(),
      binding: HomeBinding(),
    )
  ];
}
