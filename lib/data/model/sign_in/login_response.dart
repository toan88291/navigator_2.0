class LoginResponse {
  int _userId;
  String _access;
  String _refresh;

  int get userId => _userId;
  String get access => _access;
  String get refresh => _refresh;

  LoginResponse({
      int userId, 
      String access, 
      String refresh}){
    _userId = userId;
    _access = access;
    _refresh = refresh;
}

  LoginResponse.fromJson(dynamic json) {
    _userId = json["user_id"];
    _access = json["access"];
    _refresh = json["refresh"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["user_id"] = _userId;
    map["access"] = _access;
    map["refresh"] = _refresh;
    return map;
  }

}