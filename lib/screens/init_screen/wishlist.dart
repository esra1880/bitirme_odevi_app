 //FAVORİ SAYFASI


import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:foodiee/providers/wishlist_provider.dart';
import 'package:foodiee/screens/sepet/bottom_checkout.dart';
import 'package:foodiee/services/assets_manages.dart';
import 'package:foodiee/widgets/app_name_text.dart';
import 'package:foodiee/screens/sepet/sepet_widget.dart';
import 'package:foodiee/screens/sepet/empty_bag.dart';
import 'package:foodiee/widgets/products/product_widget.dart';
import 'package:foodiee/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 class WishlistScreen extends StatelessWidget {
   static const routName = "/WishlistScreen";

   const WishlistScreen({super.key});
   final bool isEmpty = false;


   @override
   Widget build(BuildContext context) {
     final wishListProvider = Provider.of<WishlistProvider>(context);

     return wishListProvider.getWishLists.isEmpty ?
     Scaffold(
         appBar: AppBar(
             centerTitle: true,
             leading: IconButton(
               onPressed: (){
                 if(Navigator.canPop(context)){
                   Navigator.pop(context);
                 }
               },
               icon: const Icon(
                 Icons.arrow_back_ios,
                 size: 20,
               ),
             ),
             title:                        Text(
               "Favorilerim",style: TextStyle(fontSize: 20),
             ),
         ),
         body: EmptyBagWidget(
             imagePath: AssetsManager.bagimg7,
             title: "",
             subtitle: "Favori yemeklerine ulaşmanın tam zamanı",
             buttonText: "Tam zamanı")
     )
         :Scaffold(
         appBar: AppBar(
             centerTitle: true,
             leading: IconButton(
               onPressed: (){
                 if(Navigator.canPop(context)){
                   Navigator.pop(context);
                 }
               },
               icon: const Icon(
                 Icons.arrow_back_ios,
                 size: 20,
               ),
             ),
             title: Text("Favorilerim ${wishListProvider.getWishLists.length}",
               style: TextStyle(fontSize: 20),
         ),
         ),
         body: DynamicHeightGridView(
           mainAxisSpacing: 12,
           crossAxisSpacing: 12,
           builder: (context,index){
             return Padding(
               padding: const EdgeInsets.all(8.0),
               child: ProductWidget(
                 productId: wishListProvider.getWishLists.values.toList()[index].productId,

               ),
             );

           },
           itemCount: wishListProvider.getWishLists.length,
           crossAxisCount: 2,
         )

     );
   }
 }