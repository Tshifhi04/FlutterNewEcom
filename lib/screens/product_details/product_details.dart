import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:new_ecom_app/constants/constants.dart';
import 'package:new_ecom_app/models/product_model/product_model.dart';
import 'package:new_ecom_app/provider/app_provider.dart';
import 'package:new_ecom_app/screens/checkout/checkout.dart.dart';
import 'package:new_ecom_app/screens/cart/cart.dart';
import 'package:new_ecom_app/screens/favourites_screen/favourites_screen.dart';
import 'package:provider/provider.dart';

import '../../constants/routes.dart';
class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;
  const ProductDetails({Key? key, required this.singleProduct});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Routes.instance.push(widget: Cart(), context: context);
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],

      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height, // Provide a height constraint
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  widget.singleProduct.image,
                  width: 500,
                  height: 300,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.singleProduct.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget.singleProduct.isFavourite =
                                !widget.singleProduct.isFavourite;
                          });
                          if (widget.singleProduct.isFavourite) {
                            appProvider.addFavouriteProduct(widget.singleProduct);
                            showMessage("Added to favourites");
                          } else {
                            appProvider.removeFavouriteProduct(widget.singleProduct);
                          }
                        },
                        icon: Icon(
                          widget.singleProduct.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(widget.singleProduct.description),
                SizedBox(height: 20),
                Row(
                  children: [
                    CupertinoButton(
                      onPressed: () {
                        if (qty > 1) {
                          setState(() {
                            qty--;
                          });
                        }
                      },
                      padding: EdgeInsets.zero,
                      child: CircleAvatar(
                        child: Icon(Icons.remove),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      qty.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    CupertinoButton(
                      onPressed: () {
                        setState(() {
                          qty++;
                        });
                      },
                      padding: EdgeInsets.zero,
                      child: CircleAvatar(
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        ProductModel productModel =
                            widget.singleProduct.copyWith(qty: qty);
                        appProvider.addCartProduct(productModel);
                        showMessage("Added to Cart");
                      },
                      child: Text("Add to cart"),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 110,
                      child: ElevatedButton(
                        onPressed: () {
                          ProductModel productModel =
                              widget.singleProduct.copyWith(qty: qty);
                          appProvider.addCartProduct(productModel);
                          Routes.instance.push(
                            context: context,
                            widget: Checkout(singleProduct: productModel),
                          );
                        },
                        child: Text("Buy"),
                      ),
                      
                    ),SizedBox(height: 20,)
                  ],
                ),
                 SizedBox(
                  height: 60,
                ),
                
               
              ],
            ),
            
          ),
           
        ),
      ),
    );
  }
}



//3:27:37