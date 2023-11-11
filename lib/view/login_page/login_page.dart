import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/view/login_page/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: Container(
            child: Text('Login Page'),
          )
      ),
    );
  }
}
