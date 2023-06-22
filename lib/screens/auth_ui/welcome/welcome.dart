import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_ecom_app/constants/asset_images.dart';
import 'package:new_ecom_app/constants/routes.dart';
import 'package:new_ecom_app/screens/auth_ui/login/login.dart';
import 'package:new_ecom_app/widgets/title_heading.dart';

import '../../../widgets/buttons.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
    
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children:  [
                     
                    TitleHeading(title: "Hello there!", Heading: "We've Got everything you need right here!"),
          Center(
                child: Image.asset(AssetsImages.instance.welcomeImage,
             // alignment: Alignment.center,
                height: 270,
                width: 750,

                
                ),
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                                       

                           
                                    CupertinoButton(
                                      onPressed: (){

                                      },
                                      padding: EdgeInsets.zero,
                                      child: const  Icon(
                                        Icons.facebook,
                                        size: 40,
                                        color: Colors.blueAccent,
                                        
                                        ),
                                    ),

                                      
                                    SizedBox(width: 20,),   
                                    
                                      CupertinoButton(
                                         onPressed: (){

                                      },
                                      padding: EdgeInsets.zero,
                                        child: Image.asset(AssetsImages.instance.google,scale: 30,)),
                                    
                              ],

                ),
                SizedBox(height: 40,),
                //buttons login and register
               Buttons(title: "Login",onPressed: (() {
                 //on pesss functionality here
                 Routes.instance.push(widget: const Login(), context:context);
               })),
                   SizedBox(height: 5,),
                  Buttons(title: "SignUp",onPressed: (() {
                 //on pesss functionality here
               })),
              
            ],),
        )
      ),
    );
  }
}