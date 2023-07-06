import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_ecom_app/models/product_model/product_model.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../constants/routes.dart';
import '../../provider/app_provider.dart';
import '../checkout/checkout.dart.dart';

class CartItem extends StatefulWidget {
  final ProductModel singleProduct;
  const CartItem({super.key, required this.singleProduct});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
int qty=1;
@override
void initState() {
  qty = widget.singleProduct.qty??1;
  setState(() {
    
  });
  super.initState();
  
}

  @override
  Widget build(BuildContext context) {
      AppProvider appProvider = Provider.of<AppProvider>(context);
    return Container(
            margin: const EdgeInsets.only(bottom:20,right: 10),
            child: Row(children: [
                
                  ///when i continue i should worke here and go onwards!!!    3:48:41
                  Expanded(
                    child: Container(
                      child: Image.network(widget.singleProduct.image),
                      height:140,
                    ),
                  ),
                   Expanded(
                    flex: 2,
                    child: SizedBox(
                      height:140,
                     // color: const Color.fromARGB(84, 33, 149, 243),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          crossAxisAlignment:CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          Column(
                            children: [
                            
                              Text(widget.singleProduct.name,style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w500),),
                                         
                               Padding(
                                 padding: const EdgeInsets.only(left:8.0),
                                 child: Row(
                                                   children:  [
                                                       CupertinoButton(
                                                         onPressed: (){
                                                          
                                                            if(qty>1){
                                                             setState(() {
                                                                    qty--;
                                                             });
                                                             appProvider.updateQty(widget.singleProduct,qty);
                                                            }
                                                             
                                                         },
                                                         padding: EdgeInsets.zero,
                                                         child: CircleAvatar(
                                                           maxRadius: 15,
                                                           child:Icon(Icons.remove),
                                                         ),
                                                       ),
                                                         SizedBox(width: 5,),
                                                    Text(widget.singleProduct.qty.toString(),
                                                    style: const TextStyle(
                                                     fontSize: 20,
                                                     fontWeight: FontWeight.bold,
                                                    ),),
                                                   const SizedBox(width: 5,),
                                                   
                                                     CupertinoButton(
                                                         onPressed: (){
                                                          
                                                           setState(() {
                                                             qty++;
                                                           });
                                                           appProvider.updateQty(widget.singleProduct,qty);
                                                         },
                                                         padding: EdgeInsets.zero,
                                                         child: CircleAvatar(
                                                          maxRadius: 15,
                               
                                                           child:Icon(Icons.add),
                                                         ),
                                                       )
                                                   ],
                                                   
                                                 ),
                                                                    //       Text("Price:   R25000",style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),),

                               ),
                                                         Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                           children: [
                                                             CupertinoButton(padding: EdgeInsets.zero,
                                                             onPressed: (){
                                                               if(widget.singleProduct.isFavourite){
                               appProvider.addFavouriteProduct(widget.singleProduct);
                               showMessage("Added to favourites");
                            }
                            else{
                               appProvider.removeFavouriteProduct(widget.singleProduct);

                            }
                                                             },child: Text(  appProvider.getFavouriteProductList.contains(widget.singleProduct)?"Add to wishlist":"Remove from wishlist",style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),)
                                                             ),
                                                             

                                                             
                                                           SizedBox(width: 10,),
                                                        CupertinoButton(padding: EdgeInsets.zero,
                                                             onPressed: (){
                                                               AppProvider appProvider = Provider.of<AppProvider>(context,listen: false);
                     appProvider.removeCartProduct(widget.singleProduct);
                      showMessage("Successfully removed from cart");
                                                             },child:const CircleAvatar(backgroundColor: Colors.blueAccent,
                                                              child: Icon(Icons.delete,color: Colors.white,size: 15,),
                                                               maxRadius: 10,
                                                             )),
                                                            ],
                                                           
                                                         ),

                                            

                            ],
                          ),
                          Text("\R${widget.singleProduct.price.toString()}",style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),),
                        ]),
                        
                      ),
                    ),
                  ),
               const SizedBox(height: 20,),
             
                ]
                ),  
                
                
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color:Colors.blueAccent,width: 3),
              ),


          
           );
           
  }
}