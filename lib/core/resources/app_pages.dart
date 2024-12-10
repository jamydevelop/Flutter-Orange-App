import 'package:get/get.dart';

import '../../feature/authentication/presentation/login/login_binding.dart';
import '../../feature/authentication/presentation/login/login_page.dart';
import '../../feature/splash/splash_binding.dart';
import '../../feature/splash/splash_page.dart';
import '../../feature/welcome/welcome_binding.dart';
import '../../feature/welcome/welcome_page.dart';
import 'app_routes.dart';

class AppPages {

  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.welcome, 
      page: () => const WelcomePage(),
      binding: WelcomeBinding()
    ),
    GetPage(
      name: AppRoutes.login, 
      page: () => const LoginPage(),
      binding: LoginBinding()
    ),
    GetPage(
      name: AppRoutes.splash, 
      page: () => const SplashPage(),
      binding: SplashBinding()
    )
  ];
}