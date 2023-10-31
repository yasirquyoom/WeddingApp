class ApiUtilities {
  static String baseURL = 'http://ec2-13-233-16-176.ap-south-1.compute.amazonaws.com:8080/';

  static String sendOtp = baseURL + 'auth/verifyPhone/sendOtp';
  static String verifyOtp = baseURL + 'auth/verifyPhone/compareOtp';
  static String createProfile = baseURL + 'user/createProfile';
  static String createProfilePicture = baseURL + 'user/profile/photo';
  static String eventCreate = baseURL + 'events/create/v2';
  static String uploadPhoto = baseURL + 'events/cover/photo/';

}