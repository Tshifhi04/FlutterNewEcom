import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';

UserModel userModellFromJson (String str) => UserModel.fromJson(json.decode(str));


String userModelToJson (UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
      required this.image,
      required this.id,
      required this.firstName,
     required this.lastName,
      required this.phoneNumber,
        required this. email,
   

    });
    String id;
    String? image;
    String firstName;
   
    String lastName;
    String phoneNumber;
    String email;

    factory UserModel.fromJson(Map<String,dynamic> json) => UserModel(image: json["image"],firstName: json["firstName"], id: json["id"], lastName: json["lastName"],phoneNumber: json["phoneNumber"], email: json["email"]);

    Map<String,dynamic> toJson()=>{
      "id":id,
     
      "image":image,
       "firstName":firstName,
      "lastName":lastName,
      "phoneNumber":phoneNumber,
      "email":email


    };
}