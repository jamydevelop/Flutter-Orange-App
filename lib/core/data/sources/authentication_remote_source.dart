import '../models/login_response_model.dart';

abstract class AuthenticationRemoteSource {

  Future<LoginResponseModel> login(body);
}