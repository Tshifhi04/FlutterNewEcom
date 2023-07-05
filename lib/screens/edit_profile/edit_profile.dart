// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:flutter/cupertino.dart';
//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:new_ecom_app/constants/constants.dart';
//import 'package:new_ecom_app/firebase_helper/firebase_storage_helper/firebase_storage_helper.dart';
import 'package:new_ecom_app/models/user_model/user_model.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
File? image;

void takePicture() async {
  
   XFile? value = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 40);

        if (value != null) {
          setState(() {
            image = File(value.path);
          });
        }
}

  TextEditingController email = TextEditingController();

  TextEditingController phoneNumber = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  
    @override
  Widget build(BuildContext context) {
     AppProvider appProvider = Provider.of<AppProvider>(context);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Profile",
        style: TextStyle(color: Colors.black),
        ),
      ),

        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: [

          image ==null?  CupertinoButton(
              onPressed: (){
                      takePicture();
              },
              child: CircleAvatar(
                radius: 80,
                child: Icon(Icons.camera_alt_outlined),
              ),
            )
            
            : 
            CupertinoButton(
              onPressed: (){
                      takePicture();
              },
              child: CircleAvatar(
                backgroundImage: FileImage(image!),
                radius: 80,
               // child: Icon(Icons.camera_alt_outlined),
              ),
            ),SizedBox(height: 10,),
            TextFormField(
              controller: firstName,
              decoration: InputDecoration(
                hintText: appProvider.getUserInformation.firstName,
              ),
            ),
             SizedBox(height: 10,),

            
             TextFormField(
              controller: lastName,
              decoration: InputDecoration(
                hintText: appProvider.getUserInformation.lastName,
              ),
            ),            SizedBox(height: 10,),

             TextFormField(
                          //  controller: email,

              decoration: InputDecoration(
                hintText: appProvider.getUserInformation.email,
              ),
            ),            SizedBox(height: 10,),

             TextFormField(
                            controller: phoneNumber,

              decoration: InputDecoration(
                hintText: appProvider.getUserInformation.phoneNumber,
              ),
            ),

            SizedBox(height: 20,),


            ElevatedButton(onPressed: ()async {
              UserModel userModel = appProvider.getUserInformation.copyWith(lastName:lastName.text,firstName: firstName.text,phoneNumber: phoneNumber.text);
              appProvider.updateUserInformation(context, userModel, image);

            }, child: const Text("Update"))

          ],
        )




    );
  }
}