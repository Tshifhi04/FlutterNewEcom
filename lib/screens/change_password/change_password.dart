import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_ecom_app/constants/constants.dart';
import 'package:new_ecom_app/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

    bool  isShowPassword = true;
    TextEditingController newpassword = TextEditingController();
    TextEditingController confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

           appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          
          padding: const EdgeInsets.only(left:58.0),
          child: const Text("Change Password",
          style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 150,),
          TextFormField(
                    controller: newpassword,
                    obscureText: isShowPassword,
                    decoration: InputDecoration(
                      hintText: "New Password",
                      
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
                  SizedBox(height: 30,),
                    TextFormField(
                    controller: confirmpassword,
                    obscureText: isShowPassword,
                    decoration: InputDecoration(
                      hintText: "confirm Password",
                      
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
        
        
                  ),SizedBox(height:150),

                    ElevatedButton(onPressed: ()async {
                      if(newpassword.text.isEmpty){
                          showMessage("please enter your password");
                      }
                      else if(confirmpassword.text.isEmpty){
                          showMessage("please confirm your password");
                      }
                      else if(confirmpassword.text == newpassword.text){
                              FirebaseAuthHelper.instance.ChangePassword(newpassword.text, context);

                       }
                        else{
                              showMessage("Passwords do not match");
                            }
                      

            }, child: const Text("Update"))
        ],
      ),

    );
  }
}