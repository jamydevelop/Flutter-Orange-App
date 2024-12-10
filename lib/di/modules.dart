import 'package:get/get.dart';

import '../core/data/repositories/authentication_repository.dart';
import '../core/data/sources/authentication_remote_source.dart';
import '../feature/authentication/data/repository/authentication_repository_impl.dart';
import '../feature/authentication/data/source/authentication_remote_source_impl.dart';

Future<void> initAppDependencies() async {

  Get.put<AuthenticationRemoteSource>(
    AuthenticationRemoteSourceImpl(),
    permanent: true
  );

  Get.put<AuthenticationRepository>(
    AuthenticationRepositoryImpl(
      authenticationRemoteSource: Get.find()
    ),
    permanent: true
  );
}