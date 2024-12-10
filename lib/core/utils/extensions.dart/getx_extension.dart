import 'package:get/get.dart';

extension GetxExtension on GetxController {


  void dismissKeyboard() {
    Get.focusScope?.unfocus();
  }
}