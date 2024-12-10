import 'feature_login_data_entity.dart';

class FeatureLoginEntity {
  
  final String type;
  final FeatureLoginDataEntity data;
  final String dbt;

  const FeatureLoginEntity({
    required this.type,
    required this.data,
    required this.dbt
  });
}