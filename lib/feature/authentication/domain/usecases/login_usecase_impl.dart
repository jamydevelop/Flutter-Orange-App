import '../../../../core/data/repositories/authentication_repository.dart';
import '../../../../core/domain/entities/login_entity.dart';
import '../../../../core/domain/usecases/login_usecase.dart';
import '../payload/login_param.dart';

class LoginUseCaseImpl extends LoginUseCase {

  LoginUseCaseImpl({
    required this.authenticationRepository
  });

  final AuthenticationRepository authenticationRepository;

  @override
  Future<LoginEntity> execute({required String email, required String password}) {

    var param = LoginParam(
      email: email, 
      password: password
    );

    return authenticationRepository.login(param);
  }
}