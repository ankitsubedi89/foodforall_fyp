import 'package:flutter/material.dart';
import 'package:foodforall_fyp/views/pages/loader.dart';
// import 'package:foodforall_fyp/views/pages/signup_screen.dart';
import 'package:get/get.dart';



// void main() {
  Future<void> main() async{
    WidgetsFlutterBinding.ensureInitialized();
  // runApp(const MaterialApp(home:HomePage()));
  // runApp(const MaterialApp(home:MyButton()));
  // runApp(const MaterialApp(home:Calculator()));
  // runApp( MaterialApp(home:SignupPage()));
  runApp(const MaterialApp(
    home: GetMaterialApp(
      title: 'My First Flutter Project',
      home: Loader(),
    ),
  ));
}