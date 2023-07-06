import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:new_ecom_app/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:new_ecom_app/screens/auth_ui/login/login.dart';
import 'package:new_ecom_app/screens/auth_ui/welcome/welcome.dart';
import 'package:new_ecom_app/screens/change_password/change_password.dart';
import 'package:new_ecom_app/screens/edit_profile/edit_profile.dart';
import 'package:new_ecom_app/screens/favourites_screen/favourites_screen.dart';
import 'package:new_ecom_app/widgets/buttons.dart';
import 'package:provider/provider.dart';

import '../../constants/routes.dart';
import '../../provider/app_provider.dart';
import '../order_screen/order_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
       AppProvider appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: const Text("Account",style:TextStyle(
            color:Colors.black,
            
          )),
        ),
      ),
      body: Column(
        children: [
           Expanded(child: Column(
            children: [
                appProvider.getUserInformation.image==null? Icon(Icons.person_outlined,size: 100,): CircleAvatar(
                backgroundImage: NetworkImage(appProvider.getUserInformation.image!),
                radius: 45,
               // child: Icon(Icons.camera_alt_outlined),
              ),
                 Text(appProvider.getUserInformation.firstName +"   " +appProvider.getUserInformation.lastName,style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                     )),
                    
                       Text(appProvider.getUserInformation.email,
                     ),SizedBox(height: 9,),
                 SizedBox(
                  width: 150,
                   child: ElevatedButton(onPressed: () {
                    Routes.instance.push(widget:EditProfile(),context: context);
                   },
                   child: Text("Manage Profile"),),
                 )
            ],
          )),
       
           Expanded(flex: 2,child: Container(
                  child: Column(
                    children: [
                      ListTile(
                        onTap: ()=> {
                                                    Routes.instance.push(widget:OrderScreen(),context: context)

                        },
                        leading: Icon(Icons.shopping_bag_outlined),
                        title: Text("Your Orders"),
                      ),
                      ListTile(
                        onTap: ()=> {
                                              Routes.instance.push(widget:FavouritesScreen(),context: context)

                        },
                        leading: Icon(Icons.favorite_outline),
                        title: Text("Favourites"),
                      ),
                      ListTile(
                        onTap: ()=> {
                                                                        Routes.instance.push(widget:FavouritesScreen(),context: context)

                        },
                        leading: Icon(Icons.info_outline),
                        title: Text("About us"),
                      ),
                      ListTile(
                        onTap: ()=> {
                                                                        Routes.instance.push(widget:FavouritesScreen(),context: context)

                        },
                        leading: Icon(Icons.handshake_outlined),
                        title: Text("Support"),
                      ),  ListTile(
                        onTap: ()=> {
                         // FirebaseAuthHelper.instance.signOut()
                        Routes.instance.push(widget: ChangePassword(), context: context)
                        },
                        leading: Icon(Icons.change_circle_outlined),
                        title: Text("Change Password"),
                      ),  ListTile(
                        onTap: ()=> {
                          FirebaseAuthHelper.instance.signOut()
                          ,setState(() {
                                               Routes.instance.push(widget: Login(), context: context);

                          })
                        },
                        leading: Icon(Icons.logout_outlined),
                        title: Text("Log Out"),
                      ),SizedBox(height: 10,),
                   //   Text("Version   1.0.0"),
                     // Text("Vhuhulwi Technologies ®")
                    ],),
                    
           ),)
        ],
      ),
    );
  }
}