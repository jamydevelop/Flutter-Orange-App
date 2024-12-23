import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import '../exceptions/time_out_exception.dart';
import '../resources/api_endpoint.dart';
import '../exceptions/app_exception.dart';
import '../exceptions/fetch_data_exception.dart';
import '../resources/strings.dart';
import 'enums/method.dart';

abstract class BaseGetConnect extends GetConnect {
  
  @override
  String get baseUrl => APIEndpoint.getBaseUrl;

  Future<Response<dynamic>> methodRequest(
    String url, {
    required Method method,
    Object? params,
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    try {

      Response<dynamic> response;

      response = await request(
        url,
        method.name,      
        body: params,
        contentType: contentType,
        headers: headers,
        query: query,
      );
      log('\n METHOD: ${method.name}');
      log('\n -Url: ${response.request?.url} \n -Body: ${response.body} \n -Params: $params');

      if ((response.statusCode == 200 || response.statusCode == 201) && response.body != null) {
        var exception = _getException(response.body);
        if(exception != null){
          throw exception;
        }
        return response;
      } else if (response.statusCode == 404 || response.statusCode == 400) {
        var exception = _getException(response.body);
        if(exception != null){
          throw exception;
        } else {
          throw FetchDataException(Strings.somethingWentWrong);
        }
      } else if (response.statusCode == 500 &&
          (response.body != null || response.body == null)) {
        throw FetchDataException(Strings.somethingWentWrong);
      } else if (response.statusCode == null && response.body == null) {
        throw FetchDataException(Strings.noInternetConnection);
      } else {
        throw FetchDataException(Strings.somethingWentWrong);
      }
    } on TimeoutException catch (_) {
      throw TimeOutException(Strings.timeoutException);
    } on SocketException {
      throw FetchDataException(Strings.noInternetConnection);
    }
  }

  AppException? _getException(dynamic response) {
    String? error;
    try {
      if (response is Map<String, dynamic>) {
        final hasError = response['status_message'] != null && response['status_message'] == "Error";
        final condition = response['message'] != null && hasError;

        if (condition) {
          error = response['message'].toString();
        }
      
      } else {
        
        final jsonResponse = jsonDecode(response);
        final hasError = response['status_message'] != null && response['status_message'] == "Error";
        final condition = jsonResponse['message'] != null && hasError;

        if (condition) {
          error = jsonResponse['message'].toString();
        }
      }
    } catch (e) {      
      error = null;
    }
    
    return _getExceptionFromErrorResponse(error);
  }

  AppException? _getExceptionFromErrorResponse(String? error) {
    return FetchDataException(error);
  }

  @override
  void onInit() {
    httpClient.timeout = const Duration(seconds: 30);
    super.onInit();
  }
}