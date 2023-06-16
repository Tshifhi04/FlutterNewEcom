import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleHeading extends StatelessWidget {
final String title;
final String Heading;

  const TitleHeading({super.key,required this.title,required this.Heading});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

            children: [
                             

                     SizedBox(height: kToolbarHeight,),
                /*if(title == "Login" || title == "create account")
                    Padding(
                      padding: const EdgeInsets.only(left: 58.0),
                      child: BackButton(),
                    ),*/

                    SizedBox(height:5.0),
                  
                 

                 Text(title,style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold, fontFamily: 'Raleway'),),
               const SizedBox(height: 12,),
                Text(Heading,style:TextStyle(fontSize: 20, fontFamily: 'Raleway')),
                SizedBox(height: 10,)
           
            ], 
      
    );
  }
}