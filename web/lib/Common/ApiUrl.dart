class ApiUrl {
  static String baseURL = 'http://127.0.0.1:90/API/web/';

  static const String login = 'login';
  static const String forgotPassword = 'forgotPassword';
  static const String resetPassword = 'resetPassword';
  static const String createMember = 'createMember';
  static const String signUp = 'signUp';
  static const String getMemberList = 'getMemberList';
  static const String deleteMember = 'deleteMember';
  static const String reportBug = 'reportBug';
  static const String updateUserData = 'updateUserData';
  static const String newTransaction = 'newTransaction';

  static String getURL(String url) {
    return baseURL + url.toString();
  }
}
