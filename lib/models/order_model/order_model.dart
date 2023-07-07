



import 'package:new_ecom_app/models/product_model/product_model.dart';



class OrderModel {
    OrderModel({
      
      required this.orderId,
      required this.totalPrice,
     required this.products,
      required this.status,
        required this. payment,
        required this. qty,
   

    });
    String payment;
    String status;
    List <ProductModel> products;
    String orderId;
    double totalPrice;
        int? qty;

   
 

    factory OrderModel.fromJson(Map<String,dynamic> json){
      List <dynamic> productMap = json["products"];
      return OrderModel
      (
        
        totalPrice: json["totalPrice"],
        orderId: json["orderId"],
        status: json["status"],
        payment: json["payment"],
        qty: json["qty"],
        products:productMap.map((e) => ProductModel.fromJson(e)).toList(),
      );

    }
/*
    Map<String,dynamic> toJson()=>{
      //"orderId":orderId,
     
      "totalPrice":totalPrice,
       "products":products,
      "status":status,
      "payment":payment,
    


    };*/




    
   


}