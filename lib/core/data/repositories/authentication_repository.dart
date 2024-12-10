import '../../../feature/authentication/domain/payload/login_param.dart';
import '../../domain/entities/login_entity.dart';

abstract class AuthenticationRepository {

  Future<LoginEntity> login(LoginParam param);
}