import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/domain/usecases/login_usecase.dart';
import '../../../../core/resources/app_routes.dart';

class LoginController extends GetxController {

  LoginController({
    required this.loginUseCase
  });

  final LoginUseCase loginUseCase;
  StreamSubscription? _loginUseCaseSubs;


  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxString errorEmail = "".obs;
  RxString errorPassword = "".obs;

  RxString alertmsg = "".obs;

  RxBool isLoading = false.obs;

  void login() {

    var email = emailController.text;
    var password = passwordController.text;

    errorEmail("");
    errorPassword("");

    if (email.isEmpty) {
      errorEmail("Email is empty");
      update();
    }

    if (password.isEmpty) {
      errorPassword("Password is empty");
      update();
    }

    else if (email.isNotEmpty && password.isNotEmpty) {

      isLoading(true);
      update();

      _loginUseCaseSubs?.cancel();
      _loginUseCaseSubs = loginUseCase.execute(email: email, password: password).asStream().listen((data) {

        isLoading(false);
        
        if (data.data.alertmsg.contains("Student account not found! Please try again.")) {
          errorPassword(data.data.alertmsg);
        } else if (data.data.alertmsg.contains("Invalid Password! Please try again.")) {
          errorPassword(data.data.alertmsg);
        } else {
          Get.toNamed(AppRoutes.welcome);
        }

        update();
      },
      cancelOnError: true,
      onError: (err) {
        log("login Err = $err");
        isLoading(false);
        update();
      });
    }
  }

  @override
  void onClose() {
    _loginUseCaseSubs?.cancel();
    super.onClose();
  }
}