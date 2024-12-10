import 'dart:convert';
import 'dart:developer';

import 'package:orange_app/feature/authentication/mapper/login_response_mapper.dart';

import '../../../../core/data/models/login_response_model.dart';
import '../../../../core/data/sources/authentication_remote_source.dart';
import '../../../../core/resources/api_endpoint.dart';
import '../../../../core/resources/app_config.dart';
import '../../../../core/resources/keys.dart';
import '../../../../core/utils/enums/method.dart';
import '../model/feature_login_response_model.dart';
import 'package:http/http.dart' as http;

class AuthenticationRemoteSourceImpl implements AuthenticationRemoteSource {
  
  @override
  Future<LoginResponseModel> login(body) async {

    final url = Uri.parse("${AppConfig.getVariables[Keys.baseUrlKey]}${APIEndpoint.login}");
    
    final headers = {
      'accept': 'application/json, text/javascript, */*; q=0.01',
      'accept-language': 'en-US,en;q=0.9',
      'cookie':
          '_ga_BQE4V99L78=GS1.1.1727433838.7.1.1727435702.0.0.0; _gid=GA1.2.1915785546.1727671206; _ga_M6GGX4PCHJ=GS1.1.1727785905.119.1.1727785992.0.0.0; _ga_0VVTHM8LY8=GS1.1.1727856607.264.0.1727856618.0.0.0; _ga=GA1.1.1539453850.1719546168; _ga_FNM7613SEG=GS1.1.1727865285.1.0.1727865314.0.0.0; csrf_cookie_name=2b300dd86c5b16c7ecac5939637e207c; ci_session=m7tn7evk6jchdrg4hf40c2cd5aqqegbg',
      'origin': 'https://oademo.orangeapps.ph',
      'priority': 'u=1, i',
      'referer': 'https://oademo.orangeapps.ph/login/student-cd73502828457d15655bbd7a63fb0bc8',
      'sec-ch-ua': '"Google Chrome";v="129", "Not=A?Brand";v="8", "Chromium";v="129"',
      'sec-ch-ua-mobile': '?0',
      'sec-ch-ua-platform': '"Windows"',
      'sec-fetch-dest': 'empty',
      'sec-fetch-mode': 'cors',
      'sec-fetch-site': 'same-origin',
      'user-agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36',
      'x-requested-with': 'XMLHttpRequest',
    };

    try {

      var request = http.MultipartRequest(Method.post.name, url)
        ..fields.addAll(body)
        ..headers.addAll(headers);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var featureResponse = FeatureLoginResponseModel.fromJson(jsonResponse);
        return featureResponse.toLoginResponseModel();
      } else {
        throw Exception('Error: ${response.statusCode}, ${response.body}');
      }
    } catch (e) {
      log("Error: $e");
      rethrow;
    }
  }
}
