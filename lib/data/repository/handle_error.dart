import 'package:dio/dio.dart';
import 'model/response_backend.dart';
import 'model/response_fail.dart';

doExpires() async {

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
      /* print("res ${error.response.statusCode} error---${ResponseFail
            .fromJson(error.response.data)
            .message}");*/
      responseBackend.code = error.response.statusCode;
      responseBackend.message = handlerError(error);
    } else {
      responseBackend.code = 500;
      responseBackend.message = "Unexpected error occured";
    }
  }
  return responseBackend;
}

String handlerError(error) {
  if (error is DioError) {
    DioError dioError = error as DioError;
    switch (dioError.type) {
      case DioErrorType.CANCEL:
        return "Request to API server was cancelled";
      case DioErrorType.CONNECT_TIMEOUT:
        return "Connection timeout with API server";
      case DioErrorType.DEFAULT:
        return "Connection to API server failed due to internet connection";
      case DioErrorType.RECEIVE_TIMEOUT:
        return "Receive timeout in connection with API server";
      case DioErrorType.RESPONSE:
        switch(dioError.response.statusCode) {
          case 404:
            return dioError.response.statusMessage;
          case 401:
            final msg = dioError.response.data['message'] ?? "";
            return msg;
          case 400:
            return  ResponseFail.fromJson(error.response.data).message;
          default:
            return "Unexpected error occured";
        }
        break;
      case DioErrorType.SEND_TIMEOUT:
        return "Send timeout in connection with API server";
    }
  }
  if (error.response != null) {
    return ResponseFail.fromJson(error.response.data).message;
  }
  return "Unexpected error occured";
}