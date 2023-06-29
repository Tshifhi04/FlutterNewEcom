import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_ecom_app/models/product_model/product_model.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;
  const ProductDetails({super.key, required this.singleProduct});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int qty=1;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){}, icon: Icon((Icons.shopping_cart))),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             // SizedBox(height: 40,),
                  Image.network(widget.singleProduct.image,width: 500,
                  height: 350,),
                 // SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.only(left:15,right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.singleProduct.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),),
                          IconButton(onPressed: (){
                            setState(() {
                                widget.singleProduct.isFavourite = !widget.singleProduct.isFavourite;
                            });
                          }, icon: Icon(widget.singleProduct.isFavourite?Icons.favorite:Icons.favorite_border))

                    
                      ],
                    ),
                   
                  ),
                  Text(widget.singleProduct.description),
                  SizedBox(height: 20,),
                  Row(
                    children:  [
                        CupertinoButton(
                          onPressed: (){
                           
                             if(qty>1){
                              setState(() {
                                qty--;
                              });
                             }
                              
                          },
                          padding: EdgeInsets.zero,
                          child: CircleAvatar(
                            child:Icon(Icons.remove),
                          ),
                        ),
                          SizedBox(width: 10,),
                     Text(qty.toString(),
                     style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                     ),),
                    SizedBox(width: 10,),
                    
                      CupertinoButton(
                          onPressed: (){
                            setState(() {
                              qty++;
                            });
                          },
                          padding: EdgeInsets.zero,
                          child: CircleAvatar(
                            child:Icon(Icons.add),
                          ),
                        )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ OutlinedButton(onPressed: (){}, child: Text("Add to cart")), SizedBox(width:10 ,), ElevatedButton(onPressed:(){}, child: Text("\Buy"))],
                  ),
                  SizedBox(
                    height: 15,
                  )

                   

            ]
            ),
        ),



    );
  }
}


//3:27:37