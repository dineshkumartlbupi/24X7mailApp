class APIConstants {
  static const String baseUrl = 'https://service.24x7mail.com/';
  static const String loginUser = 'user/login';

  ///GetApis Operators
  static const String operatorLink = 'operator/list';
  static const String getStateList = 'state';
  static const String addOperator = 'operator/register';
  static const String rejectOperator = 'operator/reject';
  static const String deleteOperator = 'operator/delete';
  // https://service.24x7mail.com/operator/delete
}

class ApiURl {
  static const String baseUrl = APIConstants.baseUrl;
  static const String operatorUrl = baseUrl + APIConstants.operatorLink;
  static const String getStateUrl = baseUrl + APIConstants.getStateList;
  static const String userLoginUrl = baseUrl + APIConstants.loginUser;
  static const String postOperatorList = baseUrl + APIConstants.addOperator;
  static const String postOperatorReject =
      baseUrl + APIConstants.rejectOperator;
  static const String deleteOperatorApi = baseUrl + APIConstants.deleteOperator;
}
