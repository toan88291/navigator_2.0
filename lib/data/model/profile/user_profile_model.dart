class UserProfileModel {
  int _id;
  String _username;
  String _email;
  Two_factor_token _twoFactorToken;
  bool _enableNotification;
  bool _enableEmailNotification;
  String _phoneNumber;
  String _countryCode;

  int get id => _id;
  String get username => _username;
  String get email => _email;
  Two_factor_token get twoFactorToken => _twoFactorToken;
  bool get enableNotification => _enableNotification;
  bool get enableEmailNotification => _enableEmailNotification;
  String get phoneNumber => _phoneNumber;
  String get countryCode => _countryCode;

  UserProfileModel({
      int id, 
      String username, 
      String email, 
      Two_factor_token twoFactorToken, 
      bool enableNotification, 
      bool enableEmailNotification, 
      String phoneNumber, 
      String countryCode}){
    _id = id;
    _username = username;
    _email = email;
    _twoFactorToken = twoFactorToken;
    _enableNotification = enableNotification;
    _enableEmailNotification = enableEmailNotification;
    _phoneNumber = phoneNumber;
    _countryCode = countryCode;
}

  UserProfileModel.fromJson(dynamic json) {
    _id = json["id"];
    _username = json["username"];
    _email = json["email"];
    _twoFactorToken = json["two_factor_token"] != null ? Two_factor_token.fromJson(json["two_factor_token"]) : null;
    _enableNotification = json["enable_notification"];
    _enableEmailNotification = json["enable_email_notification"];
    _phoneNumber = json["phone_number"];
    _countryCode = json["country_code"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["username"] = _username;
    map["email"] = _email;
    if (_twoFactorToken != null) {
      map["two_factor_token"] = _twoFactorToken.toJson();
    }
    map["enable_notification"] = _enableNotification;
    map["enable_email_notification"] = _enableEmailNotification;
    map["phone_number"] = _phoneNumber;
    map["country_code"] = _countryCode;
    return map;
  }

}

class Two_factor_token {
  int _id;
  String _status;
  String _formatOtpToken;
  String _otpToken;

  int get id => _id;
  String get status => _status;
  String get formatOtpToken => _formatOtpToken;
  String get otpToken => _otpToken;

  Two_factor_token({
      int id, 
      String status, 
      String formatOtpToken, 
      String otpToken}){
    _id = id;
    _status = status;
    _formatOtpToken = formatOtpToken;
    _otpToken = otpToken;
}

  Two_factor_token.fromJson(dynamic json) {
    _id = json["id"];
    _status = json["status"];
    _formatOtpToken = json["format_otp_token"];
    _otpToken = json["otp_token"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["status"] = _status;
    map["format_otp_token"] = _formatOtpToken;
    map["otp_token"] = _otpToken;
    return map;
  }

}