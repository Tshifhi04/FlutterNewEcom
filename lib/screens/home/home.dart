import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_ecom_app/firebase_helper/firebase_firestore/firebase_firestore.dart';
import 'package:new_ecom_app/models/category_model/category_model.dart';
import 'package:new_ecom_app/models/product_model/product_model.dart';
import 'package:new_ecom_app/provider/app_provider.dart';
import 'package:new_ecom_app/screens/category_view/category_view.dart';
import 'package:new_ecom_app/screens/product_details/product_details.dart';
import 'package:new_ecom_app/widgets/title_heading.dart';
import 'package:provider/provider.dart';

import '../../constants/routes.dart';
import '../auth_ui/login/login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
List<CategoryModel> categoriesList= [];
List<ProductModel> productList= [];//what we have for you AKA best products or top selling!!!



bool isLoading =false;

@override
void initState() {
   AppProvider appProvider = Provider.of<AppProvider>(context,listen: false);
    appProvider.getUserInfofirebase();
    getCategoryList();
   // getProductList();
   // getProductList();////what we have for you AKA best products or top selling!!!
    super.initState();
  }


void getCategoryList()async{
  
    isLoading=true;

    //isLoading=false;
  
  categoriesList=  await FirebaseFirestoreHelper.instance.getCategories();
  productList=  await FirebaseFirestoreHelper.instance.getWhatWeHaveForYou();//what we have for you AKA best products or top selling!!!
 
 
 
 
  productList.shuffle();

   setState(() {
    isLoading=false;
  });

}



Widget build(BuildContext context) {
  return Scaffold(
    body: isLoading?Center(child:Container(
      height: 100,
      alignment: Alignment.center,
      width: 200,
      child:CircularProgressIndicator(),
    )): SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(3.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleHeading(title: "E commerce App", Heading: ""),
                TextFormField(
                  decoration: InputDecoration(hintText: "Search..."),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Categories",
                    style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          categoriesList.isEmpty?(Center(child: Text("Categories is empty"),))
          :SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categoriesList.map((e) => Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){
                    Routes.instance.push(widget: CategoryView(categoryModel:e), context: context);
                  },
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
          ),
      //  const  SizedBox(height: 2),
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
                  child: Column(
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
                            SizedBox(height: 500,)
       ],
      ),
    ),
  );

  }
}   
        
          





/*

List<String> categoriesList =[
"https://cdni.iconscout.com/illustration/premium/thumb/gadgets-3395110-2862652.png",
"https://png.pngtree.com/png-clipart/20230511/original/pngtree-free-vector-book-lover-composition-with-stack-of-colorful-books-pencil-png-image_9157942.png",
"https://png.pngtree.com/png-clipart/20230427/original/pngtree-our-service-label-png-image_9108182.png",
"https://img.pikbest.com/png-images/20190829/toys-in-cartoon-box-vector_2528085.png!bw700",
"https://static.vecteezy.com/system/resources/previews/018/868/352/original/age-rating-sign-over-18-on-transparent-background-free-png.png",
"https://cdn.pixabay.com/photo/2022/09/13/15/35/whisky-7452196_1280.png",

];



List<ProductModel> whatWeHaveForYou =[
  ProductModel(
          id:"1",
      name:"Iphone 11",
      image:"https://i0.wp.com/shelka.co.za/wp-content/uploads/2021/03/iPhone-11-64GB-1-removebg-preview.png?resize=270%2C315&ssl=1",
      description:"The Apple iPhone 11 is a smartphone that was announced in September 2019 and succeeded the iPhone XR. It features a 6.1-inch Liquid Retina IPS LCD capacitive touchscreen with a resolution of 828 x 1792 pixels, a 3110 mAh battery, 256 GB storage, 4 GB RAM, and Scratch-resistant glass.1 The device has a 12MP ultra-wide-angle camera at the rear with a focal length of just 13mm and an aperture of F2.4, a dedicated Night Mode for the camera, a new 12MP FaceTime selfie camera that shoots 4K60fps video, and improved Portrait mode. The iPhone 11 is powered by the Apple A13 Bionic processor and has a dedicated Night Mode for the camera, a new 12MP FaceTime selfie camera that shoots 4K60fps video, and improved Portrait mode.",
      price:"15000",
      status:"pending",
      isFavourite:false

    ), ProductModel(
          id:"2",
      name:"AlienWare Gaming Laptop",
      image:"https://i.pinimg.com/originals/89/c1/96/89c19687aa37ae357f479286669f3a1e.png",
      description:"Alienware’s newest premium gaming PCs are ultra-thin, lightning-fast, and engineered with high-performance hardware to let you game without limits. Powered by sizzling fast Intel Core processors, high-end NVIDIA GeForce RTX graphics, and NVIDIA G-Sync technology, you get unmatched performance for every AAA game on your list.",
      price:"45000",
      status:"pending",
      isFavourite:true

    ), ProductModel(
          id:"3",
      name:"Iphone 11",
      image:"https://i0.wp.com/shelka.co.za/wp-content/uploads/2021/03/iPhone-11-64GB-1-removebg-preview.png?resize=270%2C315&ssl=1",
      description:"The Apple iPhone 11 is a smartphone that was announced in September 2019 and succeeded the iPhone XR. It features a 6.1-inch Liquid Retina IPS LCD capacitive touchscreen with a resolution of 828 x 1792 pixels, a 3110 mAh battery, 256 GB storage, 4 GB RAM, and Scratch-resistant glass.1 The device has a 12MP ultra-wide-angle camera at the rear with a focal length of just 13mm and an aperture of F2.4, a dedicated Night Mode for the camera, a new 12MP FaceTime selfie camera that shoots 4K60fps video, and improved Portrait mode. The iPhone 11 is powered by the Apple A13 Bionic processor and has a dedicated Night Mode for the camera, a new 12MP FaceTime selfie camera that shoots 4K60fps video, and improved Portrait mode.",
      price:"15000",
      status:"pending",
      isFavourite:false

    ),ProductModel(
          id:"4",
      name:"Iphone 11",
      image:"https://i0.wp.com/shelka.co.za/wp-content/uploads/2021/03/iPhone-11-64GB-1-removebg-preview.png?resize=270%2C315&ssl=1",
      description:"The Apple iPhone 11 is a smartphone that was announced in September 2019 and succeeded the iPhone XR. It features a 6.1-inch Liquid Retina IPS LCD capacitive touchscreen with a resolution of 828 x 1792 pixels, a 3110 mAh battery, 256 GB storage, 4 GB RAM, and Scratch-resistant glass.1 The device has a 12MP ultra-wide-angle camera at the rear with a focal length of just 13mm and an aperture of F2.4, a dedicated Night Mode for the camera, a new 12MP FaceTime selfie camera that shoots 4K60fps video, and improved Portrait mode. The iPhone 11 is powered by the Apple A13 Bionic processor and has a dedicated Night Mode for the camera, a new 12MP FaceTime selfie camera that shoots 4K60fps video, and improved Portrait mode.",
      price:"15000",
      status:"pending",
      isFavourite:false

    ), ProductModel(
          id:"5",
      name:"Iphone 11",
      image:"https://i0.wp.com/shelka.co.za/wp-content/uploads/2021/03/iPhone-11-64GB-1-removebg-preview.png?resize=270%2C315&ssl=1",
      description:"The Apple iPhone 11 is a smartphone that was announced in September 2019 and succeeded the iPhone XR. It features a 6.1-inch Liquid Retina IPS LCD capacitive touchscreen with a resolution of 828 x 1792 pixels, a 3110 mAh battery, 256 GB storage, 4 GB RAM, and Scratch-resistant glass.1 The device has a 12MP ultra-wide-angle camera at the rear with a focal length of just 13mm and an aperture of F2.4, a dedicated Night Mode for the camera, a new 12MP FaceTime selfie camera that shoots 4K60fps video, and improved Portrait mode. The iPhone 11 is powered by the Apple A13 Bionic processor and has a dedicated Night Mode for the camera, a new 12MP FaceTime selfie camera that shoots 4K60fps video, and improved Portrait mode.",
      price:"15000",
      status:"pending",
      isFavourite:false

    ), ProductModel(
          id:"6",
      name:"Iphone 11",
      image:"https://i0.wp.com/shelka.co.za/wp-content/uploads/2021/03/iPhone-11-64GB-1-removebg-preview.png?resize=270%2C315&ssl=1",
      description:"The Apple iPhone 11 is a smartphone that was announced in September 2019 and succeeded the iPhone XR. It features a 6.1-inch Liquid Retina IPS LCD capacitive touchscreen with a resolution of 828 x 1792 pixels, a 3110 mAh battery, 256 GB storage, 4 GB RAM, and Scratch-resistant glass.1 The device has a 12MP ultra-wide-angle camera at the rear with a focal length of just 13mm and an aperture of F2.4, a dedicated Night Mode for the camera, a new 12MP FaceTime selfie camera that shoots 4K60fps video, and improved Portrait mode. The iPhone 11 is powered by the Apple A13 Bionic processor and has a dedicated Night Mode for the camera, a new 12MP FaceTime selfie camera that shoots 4K60fps video, and improved Portrait mode.",
      price:"15000",
      status:"pending",
      isFavourite:false

    )
];
*/