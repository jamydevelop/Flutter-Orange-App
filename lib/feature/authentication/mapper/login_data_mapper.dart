import '../../../core/data/models/login_data_model.dart';
import '../../../core/domain/entities/login_data_entity.dart';
import '../data/model/feature_login_data_model.dart';
import '../domain/entity/feature_login_data_entity.dart';

extension FeatureLoginDataModelExt on FeatureLoginDataModel {


  LoginDataModel toLoginDataModel() {

    return LoginDataModel(
      err: err, 
      alertmsg: alertmsg
    );
  }
}

extension LoginDataModelExt on LoginDataModel {


  FeatureLoginDataEntity toFeatureLoginDataEntity() {

    return FeatureLoginDataEntity(
      err: err, 
      alertmsg: alertmsg
    );
  }
}

extension FeatureLoginDataEntityExt on FeatureLoginDataEntity {


  LoginDataEntity toLoginDataEntity() {

    return LoginDataEntity(
      err: err, 
      alertmsg: alertmsg
    );
  }
}