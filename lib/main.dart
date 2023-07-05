import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_ecom_app/constants/theme.dart';
import 'package:new_ecom_app/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:new_ecom_app/provider/app_provider.dart';
import 'package:new_ecom_app/screens/auth_ui/login/login.dart';
import 'package:new_ecom_app/screens/auth_ui/signup/signup.dart';
import 'package:new_ecom_app/screens/auth_ui/welcome/welcome.dart';
import 'package:new_ecom_app/screens/btn_bar/btn_bar.dart';
import 'package:new_ecom_app/screens/home/home.dart';
import 'package:new_ecom_app/firebase_helper/firebase_options/firebase_options.dart';
import 'dart:io';

import 'package:new_ecom_app/screens/product_details/product_details.dart';
import 'package:provider/provider.dart';


void main() async{  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseConfig.platformOptions,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create:(context) =>   AppProvider(),
      child: MaterialApp(
        title: 'Chifhies Ecom App',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: StreamBuilder(
          stream: FirebaseAuthHelper.instance.getAuthChange,
          builder: (context, snapshot){
            if(snapshot.hasData){
            // return const Home();//Home
               return const CustomBottomBar();
            }
            return const Welcome();
          }
        )
      ),
    );
  }
}
