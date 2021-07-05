class ApiUrl {
  static String baseURL = 'http://10.0.2.2:90/API/mobile/';

  static const String login = 'login';

  static String getURL(String url) {
    return baseURL + url.toString();
  }
}
