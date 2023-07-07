

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
     // required this.status,
        required this. isFavourite,
      required this.price,
      required this.qty,

    });
    String id;
    String image;
    String description;
    String name; 
   // String status;
    bool isFavourite;
    double price;
    int? qty;

    factory ProductModel.fromJson(Map<String,dynamic> json) {
      return ProductModel(
                            image: json["image"],
                           // status: json["status"],
                            id: json["id"], 
                            name: json["name"],
                            price: double.parse(json["price"].toString()),
                            description: json["description"],
                            isFavourite: false,
                            qty:(json["qty"])
                          );
                            }

    Map<String,dynamic> toJson()=>{
      "id":id,
      "name":name,
      "image":image,
      "description":description,
      "price":price,
     // "status":status,
      "isFavourite":isFavourite,
      "qty":qty,


    };

    @override
    ProductModel copyWith({
     

    int? qty,
    })=> ProductModel(image: image, id: id, name: name, description: description, /*status: status,*/ isFavourite: isFavourite, price: price, qty: qty??this.qty);



}


