import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nzeora/Screens/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/custom_web_services.dart';
import '../models/user_data.dart';

class AuthController extends GetxController {
  var isDataSubmitting = false.obs;
  var isLoginRoute = false.obs;
  var isDataReadingCompleted = false.obs;
  var isLoggedIn = false.obs;


  void loginWithDetails(String username, String password) async {
    isDataSubmitting.value = true;
    Map<String, dynamic> dataBody = {
      CustomWebServices.userName: username,
      CustomWebServices.userPassword: password
    };

    var dataToSend = json.encode(dataBody);

    var response = await http.post(Uri.parse(CustomWebServices.loginUrl),
        body: dataToSend, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      isDataSubmitting.value = false;
      Get.snackbar("Success", "Login Successfully!",
          backgroundColor: Color(0xff24b04b),
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          borderRadius: 10,
          borderWidth: 2,
          maxWidth: 200);
      Map<String, dynamic> responseData = jsonDecode(response.body);
      //responseData["name"] = "Fahad";
      // print(res)
      CustomWebServices.userToken = UserData.fromJson(responseData).jwtToken!;
      isDataReadingCompleted.value = true;
      isLoggedIn.value = true;
      //Get.offAllNamed(RouteHelper.getInitialRoute());
      Get.to(()=>Home());

      // return responseData;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', username);
      prefs.setString('token', CustomWebServices.userToken);
      prefs.setBool('isLoggedIn', true);
      print('Token id: ${prefs.getString('token')}');
    } else {
      isDataSubmitting.value = false;
      Get.snackbar(
        "Sign Up Failed",
        "username or password didn't match.",
        snackPosition: SnackPosition.TOP,
        borderRadius: 10,
        borderWidth: 2,
      );
      isDataSubmitting.value = false;
    }
    isLoginRoute.value = false;
  }

  bool isEmailValid(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }
}
