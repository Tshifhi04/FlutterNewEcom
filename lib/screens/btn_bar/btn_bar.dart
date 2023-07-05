import 'package:flutter/material.dart';
import 'package:new_ecom_app/screens/account_screen/account_screen.dart';
import 'package:new_ecom_app/screens/cart/cart.dart';
import 'package:new_ecom_app/screens/favourites_screen/favourites_screen.dart';
import 'package:new_ecom_app/screens/favourites_screen/widgets/favourite_item.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../home/home.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({final Key? key,})
      : super(key: key);

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  PersistentTabController _controller = PersistentTabController();
  bool _hideNavBar = false;


  List<Widget> _buildScreens() => [
    Home(),
    Cart(),
     Cart(),
    FavouritesScreen(),
    AccountScreen(),

   
  

      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.home),
             title: "Home",
            inactiveIcon:const Icon(Icons.home_outlined) ,
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.white,
            inactiveColorSecondary: Colors.purple),
        PersistentBottomNavBarItem(
                      inactiveIcon:const Icon(Icons.search_outlined) ,

          icon: const Icon(Icons.search),
          title: "Search",
          activeColorPrimary: Colors.teal,
          inactiveColorPrimary: Colors.white,
         
        ),
        PersistentBottomNavBarItem(
                      inactiveIcon:const Icon(Icons.shopping_cart_outlined) ,

          icon: const Icon(Icons.shopping_cart,),
          title: "Cart",
          activeColorPrimary: Colors.blueAccent,
          inactiveColorPrimary: Colors.white,
         
        ),
        PersistentBottomNavBarItem(
                      inactiveIcon:const Icon(Icons.favorite_outline) ,

          icon: const Icon(Icons.favorite),
          title: "Favourites",
          activeColorPrimary: Colors.deepOrange,
          inactiveColorPrimary: Colors.white,
         
        ),
        PersistentBottomNavBarItem(
                      inactiveIcon:const Icon(Icons.person_outline) ,

          icon: const Icon(Icons.person),
          title: "Account",
          activeColorPrimary: Colors.indigo,
          inactiveColorPrimary: Colors.white,
        
        ),
        
      ];

  @override
  Widget build(final BuildContext context) => Scaffold(
       
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          bottomScreenMargin: 0,
        /*  onWillPop: (final context) async {
            await showDialog(
              context: context!,
              useSafeArea: true,
              builder: (final context) => Container(
                height: 50,
                width: 50,
                color: Colors.white,
                child: ElevatedButton(
                  child: const Text("Close"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
            return false;
          },*/
         
          backgroundColor: Color.fromARGB(145, 78, 122, 158),
          hideNavigationBar: _hideNavBar,
          decoration: const NavBarDecoration(colorBehindNavBar: Color.fromARGB(255, 29, 47, 151)),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          navBarStyle: NavBarStyle
              .style17, // Choose the nav bar style with this property
        ),
      );
}