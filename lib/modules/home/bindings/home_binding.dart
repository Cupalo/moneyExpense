import 'package:get/get.dart';

import '../controllers/home_controller.dart';

/// Home module bindings for dependency injection.
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Home-specific controller only
    // Global controllers are already registered in AppBinding
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
