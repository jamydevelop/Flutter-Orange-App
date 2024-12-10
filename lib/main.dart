import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orange_app/di/modules.dart';

import 'core/resources/app_config.dart';
import 'core/resources/app_pages.dart';
import 'core/resources/app_routes.dart';
import 'core/resources/environment.dart';
import 'core/resources/keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig(
    variables: {
      Keys.baseUrlKey: Environment.getBaseUrl
    }
  );
  await initAppDependencies();
  runApp(const OrangeApp());
}

class OrangeApp extends StatelessWidget {
  
  const OrangeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Orange App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true
      ),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages
    );
  }
}