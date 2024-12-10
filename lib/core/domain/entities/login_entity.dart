import 'login_data_entity.dart';

class LoginEntity {
  
  final String type;
  final LoginDataEntity data;
  final String dbt;

  const LoginEntity({
    required this.type,
    required this.data,
    required this.dbt
  });
}