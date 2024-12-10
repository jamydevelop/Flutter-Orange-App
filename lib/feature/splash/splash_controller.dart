import 'package:get/get.dart';

import '../../core/resources/app_routes.dart';

class SplashController extends GetxController {

  
  @override
  void onInit() {
    3.seconds.delay(() => Get.offAndToNamed(AppRoutes.login));
    super.onInit();
  }
}