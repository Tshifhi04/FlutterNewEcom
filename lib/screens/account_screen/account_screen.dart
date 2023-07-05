import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:new_ecom_app/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:new_ecom_app/widgets/buttons.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

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
                appProvider.getUserInformation.image==null? Icon(Icons.person_outlined,size: 100,): Image.network(appProvider.getUserInformation.image!),
                 Text(appProvider.getUserInformation.firstName +"   " +appProvider.getUserInformation.lastName,style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                     )),
                    
                       Text(appProvider.getUserInformation.email,
                     ),SizedBox(height: 14,),
                 SizedBox(
                  width: 150,
                   child: ElevatedButton(onPressed: () {
                     
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

                        },
                        leading: Icon(Icons.shopping_bag_outlined),
                        title: Text("Your Orders"),
                      ),
                      ListTile(
                        onTap: ()=> {
                          
                        },
                        leading: Icon(Icons.favorite_outline),
                        title: Text("Favourites"),
                      ),
                      ListTile(
                        onTap: ()=> {
                          
                        },
                        leading: Icon(Icons.info_outline),
                        title: Text("About us"),
                      ),
                      ListTile(
                        onTap: ()=> {
                          
                        },
                        leading: Icon(Icons.handshake_outlined),
                        title: Text("Support"),
                      ),  ListTile(
                        onTap: ()=> {
                          FirebaseAuthHelper.instance.signOut()
                          ,setState(() {
                            
                          })
                        },
                        leading: Icon(Icons.logout_outlined),
                        title: Text("Log Out"),
                      ),SizedBox(height: 20,),
                      Text("Version   1.0.0"),
                      Text("Vhuhulwi Technologies ®")
                    ],),
                    
           ),)
        ],
      ),
    );
  }
}