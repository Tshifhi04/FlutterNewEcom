import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_ecom_app/constants/routes.dart';
import 'package:new_ecom_app/screens/auth_ui/signup/signup.dart';
import 'package:new_ecom_app/screens/home/home.dart';
import 'package:new_ecom_app/widgets/buttons.dart';
import 'package:new_ecom_app/widgets/title_heading.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
bool  isShowPassword = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
         Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButton(),
                  Expanded(
                    child: TitleHeading(
                      title: "Welcome back!",
                      Heading: "Please Login and check our new hot deals for you!",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 300,),

                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.grey,),
                 
                  
                  ),


                ),
                SizedBox(height: 20,),
                TextFormField(
                  obscureText: isShowPassword,
                  decoration: InputDecoration(
                    hintText: "Password",
                    
                    prefixIcon: Icon(Icons.lock, color: Colors.grey,),
                  suffixIcon: CupertinoButton(
                       onPressed: () { 
                              setState(() {
                                isShowPassword = !isShowPassword;
                               // print(isShowPassword);
                              });
                        },
                        padding: EdgeInsets.zero,
                       child:    Icon(Icons.visibility, color: Colors.grey,),

                  )
                  
                  ),


                ),


                SizedBox(height: 40,),
                Buttons(onPressed: (){
                  Routes.instance.pushAndRemoveUntil(widget: Home(), context: context);
                }, title: "Login"),
                 SizedBox(height: 15,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                          Text(
                            "Don't Have An Account?",
                            textAlign: TextAlign.center,
                          ),
                    const SizedBox(width: 2),
                              CupertinoButton(
                                onPressed: () {
                                                  Routes.instance.push(widget: const SignUp(), context:context);

                                },
                                child: const Text("Create an account"),
                              ),
                  ],
                )





          ],
        ),


    )
    );
  }
}