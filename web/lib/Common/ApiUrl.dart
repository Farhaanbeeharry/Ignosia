class ApiUrl {
  static String baseURL = 'http://localhost:90/API/';
  static const String login = 'login';

  static String getURL(String url) {
    return baseURL + url.toString();
  }
}
