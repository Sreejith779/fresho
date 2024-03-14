import 'package:flutter/material.dart';
import 'package:fresho/features/homePage/bloc/home_bloc.dart';

import '../../cart/ui/cartPage.dart';
import '../../categoris/ui/categoies.dart';
import '../../homePage/ui/homePage.dart';
import '../../wishList/ui/wishList.dart';



class RoutesPage extends StatefulWidget {
  const RoutesPage({super.key});

  @override
  State<RoutesPage> createState() => _RoutesPageState();
}

class _RoutesPageState extends State<RoutesPage> {
   HomeBloc homeBloc = HomeBloc();
   int isSelected = 0;
   static final List _tabs = [
     HomePage(),
     CategoriesPage(),
     WishListPage(),
     CartPage(),
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepPurple.withOpacity(0.8),
        title: Text("Fresho App",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500
        ),),
      ),
      bottomNavigationBar: NavigationBar(
        elevation: 0,
onDestinationSelected: (index){
          setState(() {
            isSelected = index;
          });
},
        selectedIndex: isSelected,
        destinations: const [
          NavigationDestination(icon:  Icon(Icons.home), label: "Home"),
          NavigationDestination(icon:  Icon(Icons.search_outlined), label: "Categories"),
          NavigationDestination(icon:  Icon(Icons.favorite_border), label: "Wishlist"),
          NavigationDestination(icon:  Icon(Icons.shopping_cart), label: "Cart"),
        ],
      ),
body: _tabs[isSelected],
    );
  }
}
