import 'dart:convert';

import 'package:flutter/foundation.dart';

ProductModel productModelFromJson (String str) => ProductModel.fromJson(json.decode(str));


String productModelToJson (ProductModel data) => json.encode(data.toJson());

class ProductModel {
    ProductModel({
      required this.image,
      required this.id,
      required this.name,
      required this.description,
      required this.status,
        required this. isFavourite,
      required this.price,

    });
    String id;
    String image;
    String description;
    String name; 
    String status;
    bool isFavourite;
    String price;

    factory ProductModel.fromJson(Map<String,dynamic> json) => ProductModel(image: json["image"],status: json["status"], id: json["id"], name: json["name"],price: json["price"], description: json["description"],isFavourite: false);

    Map<String,dynamic> toJson()=>{
      "id":id,
      "name":name,
      "image":image,
      "description":description,
      "price":price,
      "status":status,
      "isFavourite":isFavourite


    };
}