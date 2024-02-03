
import 'package:foodiee/providers/product_provider.dart';
import 'package:foodiee/providers/sepet_provider.dart';
import 'package:foodiee/screens/home_screen.dart';
import 'package:foodiee/screens/profile_screen.dart';
import 'package:foodiee/screens/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodiee/screens/sepet/sepet_screen.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';


class RootScreen extends StatefulWidget {
  static const routName = "/RootScreen";
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late List<Widget> screens;
  int currentScreen = 0;
  late PageController controller;
  bool isLoadingProd = true;
  @override
  void initState(){
    super.initState();
    screens = const [
      HomeScreen(),
      SearchScreen(),
      SepetScreen(),
      ProfileScreen(),
    ];
    controller = PageController(initialPage: currentScreen);

  }

  Future<void> fetchFctProd() async {
    final productsProvider = Provider.of<ProductProvider>(context, listen:  false);

    try{
      Future.wait({
        productsProvider.fetchProducts(),
      });

    }catch(error){
      print(error.toString());
    }
  }
  @override
  void didChangeDependencies(){
    if(isLoadingProd){
      fetchFctProd();
    }
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<SepetProvider>(context);

    return  Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreen,
        height: kBottomNavigationBarHeight,
        onDestinationSelected: (index) {
          setState(() {
            currentScreen = index;
          });
          controller.jumpToPage(currentScreen);
        },
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(
              CupertinoIcons.home,
              color: Colors.red, // Seçildiğinde kırmızı renk
            ),
            icon: Icon(CupertinoIcons.home),
            label: "AnaSayfa",
          ),
          NavigationDestination(
            selectedIcon: Icon(
              CupertinoIcons.search,
              color: Colors.red, // Seçildiğinde kırmızı renk
            ),
            icon: Icon(CupertinoIcons.search),
            label: "Search",
          ),
          NavigationDestination(
            selectedIcon: Badge(
              backgroundColor: Colors.red,
              textColor: Colors.white,
              label: Text(cartProvider.getCartItems.length.toString()),
              child: Icon(IconlyLight.bag_2),
            ),
            icon: Icon(CupertinoIcons.bag),
            label: "Sepet",
          ),
          NavigationDestination(
            selectedIcon: Icon(
              CupertinoIcons.person,
              color: Colors.red, // Seçildiğinde kırmızı renk
            ),
            icon: Icon(CupertinoIcons.person),
            label: "Profil",
          ),
        ],
      ),



    );
  }
}
