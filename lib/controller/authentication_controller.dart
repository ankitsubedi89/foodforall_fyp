import 'dart:convert';
// import 'package:flutter/material.dart';
import 'package:foodforall_fyp/utils/constants.dart';
import 'package:foodforall_fyp/utils/shared_preds.dart';
import 'package:foodforall_fyp/views/pages/home_screen.dart';
import 'package:foodforall_fyp/views/pages/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:foodforall_fyp/utils/api.dart';
import 'package:get/get.dart';

class Authentication extends GetxController {
  final _token = ''.obs;
  final authService = AuthService();

  login(data) async {
    print(data);
    var url = Uri.parse(LOGIN_API);
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      // print(jsonResponse);
      if (jsonResponse["success"]) {
        await authService.saveToken(jsonResponse["token"]);
        Get.offAll( HomeScreen());
        showMessage(message: jsonResponse["message"], isSuccess: true);

        // Get.snackbar(
        //   "Success",
        //   jsonResponse["message"],
        //   colorText: Colors.white,
        //   backgroundColor: Color.fromARGB(255, 102, 217, 106),
        // );
      } else {
        showMessage(message: jsonResponse["message"], isSuccess: false);
        // Get.snackbar(
        //   "Error",
        //   jsonResponse["message"],
        //   colorText: Colors.white,
        //   backgroundColor: Color.fromARGB(255, 178, 74, 66),
        // );
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  signUP(data) async {
    var url = Uri.parse(SIGNUP_API);
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        Get.offAll(LoginScreen());
        showMessage(message: jsonResponse["message"], isSuccess: true);
      } else {
        showMessage(message: jsonResponse["message"], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
