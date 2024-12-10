import 'feature_login_data_model.dart';

class FeatureLoginResponseModel {

  final String type;
  final FeatureLoginDataModel data;
  final String dbt;

  const FeatureLoginResponseModel({
    required this.type,
    required this.data,
    required this.dbt
  });

  factory FeatureLoginResponseModel.fromJson(Map<String, dynamic>? json) {
    return FeatureLoginResponseModel(
      type: json?['type'] ?? "", 
      data: FeatureLoginDataModel.fromJson(json?['0']),
      dbt: json?['dbt'] ?? ""
    );
  }
}