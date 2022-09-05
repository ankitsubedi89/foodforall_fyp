import 'package:flutter/material.dart';
import 'package:foodforall_fyp/utils/shared_preds.dart';
import 'package:foodforall_fyp/views/pages/loader.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  final authService = AuthService();
   HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                  child: ElevatedButton(
                      onPressed: () => logout(), child: const Text("Logout"))),
            ],
          ),
        ),
      ),
    );
  }

  logout() async {
    await authService.removeToken();
    Get.offAll(const Loader());
  }
}
    