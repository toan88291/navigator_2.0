

class ResponseFail {
  int _code;
  String _message;

  int get code => _code;
  String get message => _message;

  ResponseFail({
      int code, 
      String message}){
    _code = code;
    _message = message;
}

  ResponseFail.fromJson(dynamic json) {
    _code = json["code"];
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    map["message"] = _message;
    return map;
  }

}