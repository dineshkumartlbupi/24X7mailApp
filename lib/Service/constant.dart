class APIConstants {
  static const String baseUrl = 'https://service.24x7mail.com/';
  static const String loginUser = 'user/login';

  ///GetApis Operators
  static const String operatorLink = 'operator/list';
  static const String getStateList = 'state';
}

class ApiURl {
  static const String baseUrl = APIConstants.baseUrl;
  static const String operatorUrl = baseUrl + APIConstants.operatorLink;
  static const String getStateUrl = baseUrl + APIConstants.getStateList;
  static const String userLoginUrl = baseUrl + APIConstants.loginUser;
}
