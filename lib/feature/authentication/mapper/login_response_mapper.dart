import 'package:orange_app/feature/authentication/mapper/login_data_mapper.dart';

import '../../../core/data/models/login_response_model.dart';
import '../../../core/domain/entities/login_entity.dart';
import '../data/model/feature_login_response_model.dart';
import '../domain/entity/feature_login_entity.dart';

extension FeatureLoginResponseModelExt on FeatureLoginResponseModel {


  LoginResponseModel toLoginResponseModel() {

    return LoginResponseModel(
      type: type, 
      data: data.toLoginDataModel(), 
      dbt: dbt
    );
  }
}

extension LoginResponseModelExt on LoginResponseModel {


  FeatureLoginEntity toFeatureLoginEntity() {

    return FeatureLoginEntity(
      type: type, 
      data: data.toFeatureLoginDataEntity(), 
      dbt: dbt
    );
  }
}

extension FeatureLoginEntityExt on FeatureLoginEntity {


  LoginEntity toLoginEntity() {

    return LoginEntity(
      type: type, 
      data: data.toLoginDataEntity(), 
      dbt: dbt
    );
  }
}