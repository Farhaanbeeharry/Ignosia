class ApiUrl {
  static String baseURL = 'http://10.0.2.2:90/API/mobile/';

  static const String login = 'login';
  static const String getRecipientList = 'getRecipientList';
  static const String sendEmail = 'sendEmail';
  static const String getEventList = 'getEventList';
  static const String getScheduleForUser = 'getScheduleForUser';
  static const String setScheduleDone = 'setScheduleDone';

  static String getURL(String url) {
    return baseURL + url.toString();
  }
}
