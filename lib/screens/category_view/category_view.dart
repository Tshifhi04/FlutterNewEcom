import 'package:flutter/material.dart';
import 'package:new_ecom_app/models/category_model/category_model.dart';
import 'package:new_ecom_app/widgets/title_heading.dart';

import '../../constants/routes.dart';
import '../../firebase_helper/firebase_firestore/firebase_firestore.dart';
import '../../models/product_model/product_model.dart';
import '../product_details/product_details.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;
  const CategoryView({super.key,required this.categoryModel});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
List<ProductModel> productList= [];//view products per the category
bool isLoading =false;

  void getCategoryList()async{
  setState(() {
    isLoading=true;
  });
  //categoriesList=  await FirebaseFirestoreHelper.instance.getCategories();
  productList=  await FirebaseFirestoreHelper.instance.getCategoryView(widget.categoryModel.id);//what we have for you AKA best products or top selling!!!
  productList.shuffle();
   setState(() {
    isLoading=false;
  });
}

@override
  void initState() {

    getCategoryList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          actions: [
            IconButton(onPressed: (){}, icon: Icon((Icons.shopping_cart))),
          ],),
      body:  isLoading?Center(child:Container(
      height: 100,
      alignment: Alignment.center,
      width: 200,
      child:CircularProgressIndicator(),
    ))
    : SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              
         /*   categoriesList.isEmpty?(Center(child: Text("Categories is empty"),))
            :SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoriesList.map((e) => Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      height: 80,
                      width: 120,
                      child: Image.network(e.image),
                    ),
                  ),
                )).toList(),
              ),
            ),
    
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "What we have for you",
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
              ),
            ),*/
        //  const  SizedBox(height: 2),
    
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom:1.0),
              
              child: TitleHeading(title: widget.categoryModel.name, Heading: ""),
            ),
          ),
             productList.isEmpty?(Center(child: Text("No Top selling products and services to offer "),))
              : Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 20,childAspectRatio:1),
                itemBuilder: (ctx, index) {
                  ProductModel singleProduct = productList[index];
                  return Container(
                    //color: Colors.blueAccent,
                    //heig,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: Column(//crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                                              SizedBox(height: 2),
    
                        Padding(
                          padding: const EdgeInsets.only(bottom:10.0),
                          child: Image.network(singleProduct.image, height: 70,width: 180,),
                        ),
                        SizedBox(height: 2),
                        Text(
                          singleProduct.name,
                          style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal),
                        ),
                        Text("Price: \R${singleProduct.price}"),
                        SizedBox(height: 9),
                        SizedBox(height:45,width:140,child: OutlinedButton(onPressed: () {
    
                          Routes.instance.push(widget: ProductDetails(singleProduct: singleProduct), context: context);
                        }, 
                        style:OutlinedButton.styleFrom(side: BorderSide(color:Colors.blueAccent,width: 2.0),),child: Text("Buy",style: TextStyle(color: Colors.blueAccent),),)),
                       // SizedBox(height: 500),
                      ],
                    ),
    
                  );
                },
                
              ),
            ),
                              SizedBox(height: 20,)
         
      ],),
    )


    );
  }
}