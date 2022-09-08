class ApiList {
  static String? serverLink ='https://growingintl.net/api/v1/';
  static String? apiUrl = 'growingintl.net';
  static String? login = serverLink! + 'login';
  static String? getOtp = serverLink! + 'get-otp';
  static String? verifyOtp = serverLink! + 'verify-otp';
  static String? resetPassword = serverLink! + 'reset-password';
  static String? table = serverLink! + 'restaurant-table/table';
  static String? search = serverLink! + 'menu-search';
  static String? searches = 'menu-search';
  static String? popularItems = serverLink! + 'popular-items';
  static String? profile = serverLink! + 'me';
  static String? profileUpdate = serverLink! + "profile";
  static String? orderPost = serverLink! + "dine-in-orders";
  static String? orders = serverLink! + "dine-in-orders";
  static String? restaurantCategory =
      serverLink! + 'waiter-restaurant-category';
  static String? tokenRefresh = serverLink! + 'refresh';
}
