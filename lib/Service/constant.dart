class APIConstants {
  static const String baseUrl = 'https://service.24x7mail.com/';
  static const String loginUser = 'user/login';

  ///GetApis Operators
  static const String operatorLink = 'operator/list';
  static const String getStateList = 'state/233';
  static const String county = 'feature-country';
  static const String addOperator = 'operator/register';
  static const String rejectOperator = 'operator/reject';
  static const String deleteOperator = 'operator/delete';

  ///Customer
//  https://service.24x7mail.com/subscription/billing-statement/667d923246b74b03f473b3a7
  // https://service.24x7mail.com/user/profile
  // https://service.24x7mail.com/mails
  //https://service.24x7mail.com/subscription
  static const String customerStatement = 'subscription/billing-statement/';
  static const String customerProfile = 'user/profile';
  static const String uploadMail = 'mails';
  static const String subscriptions = 'subscription';
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
  static const String getCountryApi = baseUrl + APIConstants.county;
  static const String getProfileApi = baseUrl + APIConstants.customerProfile;
  static const String postUploadMail = baseUrl + APIConstants.uploadMail;
  static const String subscriptionsApi = baseUrl + APIConstants.subscriptions;

  ///Customer
  static const String getStatementUrl =
      baseUrl + APIConstants.customerStatement;
}
