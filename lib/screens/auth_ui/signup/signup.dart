import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_ecom_app/constants/constants.dart';
import 'package:new_ecom_app/constants/routes.dart';
import 'package:new_ecom_app/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:new_ecom_app/screens/auth_ui/login/login.dart';
import 'package:new_ecom_app/screens/home/home.dart';
import 'package:new_ecom_app/widgets/buttons.dart';
import 'package:new_ecom_app/widgets/title_heading.dart';


class SignUp extends StatefulWidget {
const SignUp({super.key});



  @override
  State<SignUp> createState() => _SignUpState();


   

}

class _SignUpState extends State<SignUp> {

    TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
      TextEditingController phoneNumber = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();


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
                        title: "Sign Up",
                        Heading: "your first step to an awesome relationship with us "
                      ),
                    ),
                  ],
                ),
             
                SizedBox(height: 240,),
                /*     TextFormField(
                    decoration: InputDecoration(
                      hintText: "Username",
                      
                      prefixIcon: Icon(Icons.verified_user, color: Colors.grey,),
                   
                    
                    ),
        
        
                  ),
                   SizedBox(height: 20,),*/
                     TextFormField(
                      controller: firstName,
                    decoration: InputDecoration(
                      hintText: "First Name",
                      
                    //  prefixIcon: Icon(Icons.email_outlined, color: Colors.grey,),
                   
                    )
                    ),
                      SizedBox(height: 20,),
                     TextFormField(
                      controller: lastName,
                    decoration: InputDecoration(
                      hintText: "Last Name",
                      
                     // prefixIcon: Icon(Icons.email_outlined, color: Colors.grey,),
                   
                    
                    ),
        
        
                  ), SizedBox(height: 20,),
        
                     TextFormField(
                      controller: phoneNumber,
                      keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Phone Number",
                      
                      prefixIcon: Icon(Icons.phone_callback, color: Colors.grey,),
                   
                    
                    ),
        
        
                  ),
                   SizedBox(height: 20,),
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
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
                  Buttons(onPressed: ()async{


  
                  bool isValidated =  signUpValidation(email.text, password.text,firstName.text,lastName.text,phoneNumber.text);
                  if (isValidated)
                  {
                    // showLoaderDialog(context);
                     bool isLogined= await  FirebaseAuthHelper.instance.SignUp(firstName.text,lastName.text,phoneNumber.text,email.text, password.text, context);
                    if (isLogined){
                 
                      Routes.instance.pushAndRemoveUntil(widget: ButtonBar(), context: context);
        
                    
                    }
                  }                  }, title: "SignUp", child: Text("null"),),
                   SizedBox(height: 15,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                            Text(
                              "I Do Have An Account!",
                              textAlign: TextAlign.center,
                            ),
                      const SizedBox(width: 2),
                                CupertinoButton(
                                  onPressed: () {
                                               Routes.instance.push(widget: const Login(), context:context);
        
                                  },
                                  child: const Text("Login"),
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



