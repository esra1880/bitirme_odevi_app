//SEPET TOPLAMI

import 'package:foodiee/providers/product_provider.dart';
import 'package:foodiee/providers/sepet_provider.dart';
import 'package:foodiee/screens/sepet/checkout_page.dart';
import 'package:foodiee/widgets/subtitle_text.dart';
import 'package:foodiee/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SepetBottomSheetWidget extends StatelessWidget {
  const  SepetBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<SepetProvider>(context);

    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: const Border(
            top:BorderSide(width: 1, color : Colors.red),
          )
      ),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:SizedBox(
            height: kBottomNavigationBarHeight +10,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    FittedBox(
                        child: TitleTextWidget(label: "Total (${cartProvider.getCartItems.length}Ürün/ ${cartProvider.getQty()} Adet)")),
                    SubTitleTextWidget(label: " \₺ ${cartProvider.geTTotal(productProvider: productsProvider).toStringAsFixed(2)} ", color: Colors.red,)
                  ],

                ),
                ),
                ElevatedButton(onPressed: (){Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckoutPage()), // Burada sayfa sınıfını çağırıyorsunuz
                );
                }, child: const Text("Ödeme"))
              ],
            ),

          )
      ),
    );
  }
}
