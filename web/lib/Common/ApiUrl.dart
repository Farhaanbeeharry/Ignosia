class ApiUrl {
  static String baseURL = 'http://127.0.0.1:90/API/web/';
static const fcmURL = "https://fcm.googleapis.com/fcm/send";
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
  static const String getTransactionList = 'getTransactionList';
  static const String deleteTransaction = 'deleteTransaction';
  static const String getBalance = 'getBalance';
  static const String createEvent = 'createEvent';
  static const String getEventList = 'getEventList';
  static const String deleteEvent = 'deleteEvent';
  static const String getDashboardData = 'getDashboardData';
  static const String getRecentTransactionData = 'getRecentTransactionData';
  static const String createCase = 'createCase';
  static const String getCaseList = 'getCaseList';
  static const String deleteCase = 'deleteCase';
  static const String getScheduleList = 'getScheduleList';
  static const String deleteSchedule = 'deleteSchedule';
  static const String getMobileUsersList = 'getMobileUsersList';
  static const String addSchedule = 'addSchedule';
  static const String getCarriedOutSchedules = 'getCarriedOutSchedules';
  static const String getBeneficiaryFromSchedule = 'getBeneficiaryFromSchedule';
  static const String markScheduleCompleted = 'markScheduleCompleted';
  static const String alterBeneficiary = 'alterBeneficiary';
  static const String getBeneficiaryList = 'getBeneficiaryList';
  static const String getBeneficiary = 'getBeneficiary';
  static const String sendEmailWithSubject = 'sendEmailWithSubject';
  static const String deleteBeneficiary = 'deleteBeneficiary';
  static const String getBugsReported = 'getBugsReported';
  static const String solveBug = 'solveBug';
  static const String getAnalyticsData = 'getAnalyticsData';

  static String getURL(String url) {
    return baseURL + url.toString();
  }
}
