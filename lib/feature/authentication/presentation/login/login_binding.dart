import 'package:get/get.dart';

import '../../../../core/domain/usecases/login_usecase.dart';
import '../../domain/usecases/login_usecase_impl.dart';
import 'login_controller.dart';

class LoginBinding extends Bindings {

  @override
  void dependencies() {

    Get.lazyPut<LoginUseCase>(
      () => LoginUseCaseImpl(
        authenticationRepository: Get.find()
      ),
      fenix: true
    );

    Get.put(
      LoginController(
        loginUseCase: Get.find()
      )
    );
  }
}