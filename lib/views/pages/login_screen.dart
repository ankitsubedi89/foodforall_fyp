import 'package:flutter/material.dart';
import 'package:foodforall_fyp/controller/authentication_controller.dart';
import 'package:foodforall_fyp/views/components/my_button.dart';
import 'package:foodforall_fyp/views/components/my_field.dart';
import 'package:foodforall_fyp/views/pages/signup_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final authentication = Get.put(Authentication());
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Form(
                key: formKey,
                child: SingleChildScrollView(
                    child: Column(children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 100,
                    width: 200,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  MyField(
                    text: 'Email',
                    controller: emailController,
                    myValidator: (value) {
                      if (!value.toString().contains("@")) {
                        return "Email is not valid";
                      }
                      return null;
                    },
                  ),
                  MyField(
                    obscureText: true,
                    text: 'Password',
                    controller: passwordController,
                  ),
                  MyButton(
                    onTap: () {
                      var isFormValid = formKey.currentState!.validate();
                      if (isFormValid) {
                        // if (!(emailController.text == 'ankitsubedi89@gmail.com' &&
                        //     emailController.text == '123456')) {
                        //       Get.to(HomeScreen());
                        //       return 'Password doesnot match';
                        //     }
                        var data = {
                          "email": emailController.text,
                          "password": passwordController.text,
                        };
                        authentication.login(data);
                      }
                    },
                    text: "Login",
                  ),
                  // Text("Forget Password?"),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(SignupPage());
                    },
                    child: const Text(
                      "Register new Account",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ])))));
  }
}
