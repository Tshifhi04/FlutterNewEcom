import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../models/product_model/product_model.dart';
import '../../../provider/app_provider.dart';

class FavouriteItem extends StatefulWidget {
  final ProductModel singleProduct;
  const FavouriteItem({super.key, required this.singleProduct});


  @override
  State<FavouriteItem> createState() => _FavouriteItemState();
}

class _FavouriteItemState extends State<FavouriteItem> {
 
  @override
  Widget build(BuildContext context) {
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
                                         
                              
                                                         Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                           children: [
                                                             CupertinoButton(padding: EdgeInsets.zero,
                                                             onPressed: (){
                                                               AppProvider appProvider = Provider.of<AppProvider>(context,listen: false);
                     appProvider.removeFavouriteProduct(widget.singleProduct);
                      showMessage("Favourite successfully removed");
                      widget.singleProduct.isFavourite=false;
                      
                                                             },child: Text("Remove from favourites",style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),)),
                                                           SizedBox(width: 10,),
                                                       /* CupertinoButton(padding: EdgeInsets.zero,
                                                             onPressed: (){
                                                              
                                                             },child:const CircleAvatar(backgroundColor: Colors.blueAccent,
                                                              child: Icon(Icons.delete,color: Colors.white,size: 15,),
                                                               maxRadius: 10,
                                                             )),*/
                                                            ],
                                                           
                                                         ),

                                            

                            ],
                          ),
                          Text("\R${widget.singleProduct.price.toString()}",style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),),
                        ]),
                        
                      ),
                    ),
                  ),
                 
                ]),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color:Colors.blueAccent,width: 5),
              ),
          
           );
  }
}