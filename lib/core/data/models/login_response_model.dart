import 'login_data_model.dart';

class LoginResponseModel {
  
  final String type;
  final LoginDataModel data;
  final String dbt;

  const LoginResponseModel({
    required this.type,
    required this.data,
    required this.dbt
  });
}