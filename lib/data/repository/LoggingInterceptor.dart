import 'package:dio/dio.dart';
import 'package:example_navigator_20/common/app_session.dart';

class LoggingInterceptor extends Interceptor {
  int _maxCharactersPerLine = 200;

  @override
  Future onRequest(RequestOptions options) async {
    if (AppSession().token != null) {
      options.headers.addAll({'Authorization': "Bearer ${AppSession().token}"});
    }
    // print("--> ${options.method} ${options.baseUrl}${options.path}");
    // print("params: ${options.queryParameters}");
    // print("<-- END HTTP");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
   /* print(
        "<--response: ${response.statusCode} ${response.request.method} ${response.request.path}");*/
    String responseAsString = response.data.toString();
    if (responseAsString.length > _maxCharactersPerLine) {
      int iterations =
          (responseAsString.length / _maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        // print(
        //     responseAsString.substring(i * _maxCharactersPerLine, endingIndex));
      }
    } else {
      // print(response.data);
    }
    // print("<-- END HTTP");

    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    // print("<-- Error -->");
    // print(err.error);
    // print(err.message);
    return super.onError(err);
  }
}
