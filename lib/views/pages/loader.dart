import 'package:flutter/material.dart';
import 'package:foodforall_fyp/utils/shared_preds.dart';
import 'package:foodforall_fyp/views/pages/home_screen.dart';
import 'package:foodforall_fyp/views/pages/login_screen.dart';
import 'package:get/get.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkifAUthenticated();
  }

  checkifAUthenticated() async {
    //wait for 2 seconds
    await Future.delayed(const Duration(seconds: 2));
    var token = await authService.getToken();
    if (token != null) {
      Get.offAll( HomeScreen());
    } else {
      Get.offAll( LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/logo.png",
              height: 200,
              width: 200,
            ),
          ),
          const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}