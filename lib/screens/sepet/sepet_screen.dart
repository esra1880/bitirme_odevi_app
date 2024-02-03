//SEPET SAYFASI

import 'package:foodiee/providers/sepet_provider.dart';
import 'package:foodiee/screens/sepet/bottom_checkout.dart';
import 'package:foodiee/services/assets_manages.dart';
import 'package:foodiee/screens/sepet/empty_bag.dart';
import 'package:foodiee/screens/sepet/sepet_widget.dart';
import 'package:foodiee/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SepetScreen extends StatelessWidget {
  const SepetScreen({super.key});
  final bool isEmpty = false;


  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<SepetProvider>(context);

    return cartProvider.getCartItems.isEmpty ?
    Scaffold(
        body: EmptyBagWidget(
            imagePath: AssetsManager.card2,
            title: "",
            subtitle: "Lezzetleri tatmaya hazır mısın",
            buttonText: "Tam zamanı")
    )
        :Scaffold(
        bottomSheet: SepetBottomSheetWidget(),
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
                AssetsManager.bagimg2
            ),

          ),
          title:  Text( "Sepet (${cartProvider.getCartItems.length})", style: TextStyle(fontSize: 30),),
          actions: [
            IconButton(onPressed: (){
              cartProvider.clearLocalCart();

            }, icon: const Icon(Icons.delete_forever_rounded, color:Colors.red))
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: cartProvider.getCartItems.length,
                    itemBuilder: (context, index){
                      return ChangeNotifierProvider.value(
                        value: cartProvider.getCartItems.values.toList()[index],
                        child: const SepetWidget(),
                      );
                    }
                )
            )
          ],
        )


    );
  }
}
