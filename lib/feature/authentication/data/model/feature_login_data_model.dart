class FeatureLoginDataModel {
  
  final int err;
  final String alertmsg;

  FeatureLoginDataModel({
    required this.err,
    required this.alertmsg
  });

  factory FeatureLoginDataModel.fromJson(Map<String, dynamic>? json) {
    return FeatureLoginDataModel(
      err: json?['err'] is String 
      ? int.tryParse(json?['err']) ?? 0 
      : (json?['err'] ?? 0),
      alertmsg: json?['alertmsg'] ?? ""
    );
  }
}