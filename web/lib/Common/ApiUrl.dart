class ApiUrl {
  static String baseURL = 'http://localhost:90/API/web/';

  static const String login = 'login';
  static const String forgotPassword = 'forgotPassword';
  static const String resetPassword = 'resetPassword';
  static const String createMember = 'createMember';
  static const String signUp = 'signUp';

  static String getURL(String url) {
    return baseURL + url.toString();
  }
}
