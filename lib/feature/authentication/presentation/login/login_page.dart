import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orange_app/core/utils/extensions.dart/getx_extension.dart';

import '../../../../core/presentation/common/common_loading_button.dart';
import '../../../../core/presentation/common/common_text_field.dart';
import '../../../../core/resources/dimensions.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.dismissKeyboard,
      child: Scaffold(
        body: GetBuilder<LoginController>(
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: largeSpacing),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: largeSpacing),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                const SizedBox(height: regularSpacing),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: largeSpacing),
                  child: Text(
                    "Email",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: largeSpacing),
                  child: CommonTextField(
                    isEnabled: !controller.isLoading.value,
                    controller: controller.emailController,
                    fillColor: Colors.white,
                    filled: true,
                    keyboardType: TextInputType.text,
                    inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Colors.grey.shade400)
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: 300.milliseconds,
                  height: controller.errorEmail.isEmpty ? 0 : 50,
                  padding: const EdgeInsets.symmetric(horizontal: largeSpacing),
                  child: Text(
                    controller.errorEmail.value,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                const SizedBox(height: regularSpacing),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: largeSpacing),
                  child: Text(
                    "Password",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: largeSpacing),
                  child: CommonTextField(
                    isEnabled: !controller.isLoading.value,
                    controller: controller.passwordController,
                    fillColor: Colors.white,
                    filled: true,
                    keyboardType: TextInputType.text,
                    hasShowHideTextIcon: true,
                    maxLines: 1,
                    inputBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Colors.grey.shade400)
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: 300.milliseconds,
                  height: controller.errorPassword.isEmpty ? 0 : 50,
                  padding: const EdgeInsets.symmetric(horizontal: largeSpacing),
                  child: Text(
                    controller.errorPassword.value,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                const SizedBox(height: largeSpacing),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: largeSpacing),
                  child: CommonLoadingButton(
                    isLoading: controller.isLoading.value,
                    onPressed: controller.login,
                    width: Get.width,
                    text: "Login",
                    textColor: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}