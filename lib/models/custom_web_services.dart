class CustomWebServices {
  //////////////////////////////Base urls for Post & Get data
  static String baseUrl='https://www.nzeora.com/wp-json/api/v1/';
  static String baseUrlLoggin='https://www.nzeora.com/wp-json/wp/v2/';
  ///////////////////////////////////// Authentication variables
  static String loginUrl = "${baseUrl}token";
  static String userName = "username";
  static String userPassword = "password";
  static String signupUrl ='${baseUrlLoggin}users/register';
  static String userEmail = "email";
  ////////////////////////////////////////////// UserData List (Every user will have a unique Token ID)
  static String userToken = "";


}