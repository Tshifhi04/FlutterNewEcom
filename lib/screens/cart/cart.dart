import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_ecom_app/constants/constants.dart';
import 'package:new_ecom_app/models/product_model/product_model.dart';
import 'package:new_ecom_app/screens/cart_item_checkout/cart_item_checkout.dart';
import 'package:new_ecom_app/screens/checkout/checkout.dart.dart';
import 'package:new_ecom_app/screens/widgets/cart_item.dart';
//import 'package:new_ecom_app/widgets/title_heading.dart';
import 'package:provider/provider.dart';

//import '../../models/product_model/product_model.dart';
import '../../constants/routes.dart';
import '../../provider/app_provider.dart';

class Cart extends StatefulWidget {
//  final ProductModel singleProduct;
Cart({super.key,/*required this.singleProduct*/});
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  
//List<ProductModel> productList= [];

int qty= 1;


  @override
  Widget build(BuildContext context) {
        AppProvider appProvider = Provider.of<AppProvider>(context);


    return 
       Scaffold(
        

 bottomNavigationBar: SizedBox(
        height:150,
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:40,right:50.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children:[
                              Text("Total",style: TextStyle(fontSize: 18,fontFamily: 'Raleway',fontWeight: FontWeight.bold),),
                                                            Text("\R ${appProvider.totalPrice().toString()}",style: TextStyle(fontSize: 18,fontFamily: 'Raleway',fontWeight: FontWeight.bold),)

                         ] 
            
              ),
                
            ),SizedBox(height: 20,),
  ElevatedButton(child: const Text("Checkout"),onPressed: (){

         appProvider.clearBuyProduct();
         appProvider.addBuyProductCartList();
        // appProvider.clearCart();
         
    //Routes.instance.push(context: context,widget: CartItemCheckout());

    if(appProvider.getBuyProductList.isEmpty){
      showMessage("Cart is empty");
    }else{

    Routes.instance.push(context: context,widget: CartItemCheckout( ));
    }
  },)
          ],
        ),
       
        
        
         ),



        appBar: AppBar(
           title: Padding(
             padding: const EdgeInsets.only(left:100.0),
             child: const Text("Cart", style: TextStyle(color: Colors.black),),
           ),), 
           body: appProvider.getCartProductList.isEmpty?Center(child: Text("You have nothing on your cart to take with you"),):ListView.builder(  itemCount:appProvider.getCartProductList.length,padding: EdgeInsets.all(2),itemBuilder: ((context, index) {
            //ProductModel singleProduct = productList[it];
             return CartItem(singleProduct: appProvider.getCartProductList[index],);
           })
      ),
      
    );
  }
}





//6:51:42