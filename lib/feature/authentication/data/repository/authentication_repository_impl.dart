import 'package:orange_app/feature/authentication/mapper/login_response_mapper.dart';

import '../../../../core/data/repositories/authentication_repository.dart';
import '../../../../core/data/sources/authentication_remote_source.dart';
import '../../../../core/domain/entities/login_entity.dart';
import '../../domain/payload/login_param.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {

  AuthenticationRepositoryImpl({
    required this.authenticationRemoteSource
  });

  final AuthenticationRemoteSource authenticationRemoteSource;

  @override
  Future<LoginEntity> login(LoginParam param) async {
    
    var response = await authenticationRemoteSource.login(param.toJson());
    var featureEntity = response.toFeatureLoginEntity();
    var entity = featureEntity.toLoginEntity();
    return entity;
  }
}