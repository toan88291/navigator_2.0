import 'dart:developer' as developer;
import 'package:dio/dio.dart';
import 'package:example_navigator_20/constraints/preference_key.dart';
import 'LoggingInterceptor.dart';
import 'handle_error.dart';
import 'model/response_backend.dart';
import 'model/response_fail.dart';

class AppRepository {
  static const TAG = 'AuthRepository';

  Dio _dio;
  static final AppRepository _instance = AppRepository._internal();

  factory AppRepository() => _instance;

  AppRepository._internal() {
    _dio = Dio();
    _dio.options.baseUrl = PreferenceKey.BASE_API;
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.connectTimeout = 20000;
    _dio.interceptors.add(LoggingInterceptor());
  }

 Future<ResponseBackend> handlerResponse(Future<Response> handle) async {
    ResponseBackend responseBackend = ResponseBackend();
    try {
      Response response = await handle;
      print('statusCode: ${response.statusCode}');
      responseBackend.code = response.statusCode;
      responseBackend.data = (response.data is Map) ? response.data  : null;
    } on DioError catch (error) {
      if (error.response != null) {
        print("res ${error.response.statusCode} error---${ResponseFail
            .fromJson(error.response.data)
            .message}");
        responseBackend.code = error.response.statusCode;
        responseBackend.message = handlerError(error);
      } else {
        responseBackend.code = 500;
        responseBackend.message = "Unexpected error occured";
      }
    }
    return responseBackend;
  }

  Future<ResponseBackend> signIn(params) async {
    final request = _dio.post("user/token/", data: params);
    final response = await handlerResponse(request);
    return response;
  }

  Future<ResponseBackend> getProfileUser() async {
    final request = _dio.get("user/profile/");
    final response = await handlerResponse(request);
    return response;
  }
}