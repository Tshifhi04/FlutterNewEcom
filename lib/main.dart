import 'package:flutter/material.dart';
import 'package:new_ecom_app/constants/theme.dart';
import 'package:new_ecom_app/screens/auth_ui/login/login.dart';
import 'package:new_ecom_app/screens/auth_ui/signup/signup.dart';
import 'package:new_ecom_app/screens/auth_ui/welcome/welcome.dart';
import 'package:new_ecom_app/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chifhies Ecom App',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const SignUp()
    );
  }
}
