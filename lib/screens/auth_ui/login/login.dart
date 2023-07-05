import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_ecom_app/constants/routes.dart';
import 'package:new_ecom_app/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:new_ecom_app/screens/auth_ui/signup/signup.dart';
import 'package:new_ecom_app/screens/home/home.dart';
import 'package:new_ecom_app/widgets/buttons.dart';
import 'package:new_ecom_app/widgets/title_heading.dart';
import 'package:new_ecom_app/constants/constants.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

bool  isShowPassword = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
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
                                        controller: email,

                    decoration: InputDecoration(
                      hintText: "Email",
                                         

                      
                      prefixIcon: Icon(Icons.email_outlined, color: Colors.grey,),
                   
                    
                    ),
        
        
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: password,
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
                  Buttons(onPressed: () async {
                   
                  bool isValidated =  loginValidation(email.text, password.text);
                  if (isValidated)
                  {
                    // showLoaderDialog(context);
                     bool isLogined= await  FirebaseAuthHelper.instance.login(email.text, password.text, context);
                    if (isLogined){
                 
                      Routes.instance.pushAndRemoveUntil(widget: ButtonBar(), context: context);
        
                    
                    }
                  }
                  }, title: "Login", child: Text("null"),),
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
        
        
            ),
        )
    );
  }
}