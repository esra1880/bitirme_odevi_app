//SİPARİŞLERİM

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:foodiee/providers/viewed_recently_providers.dart';
import 'package:foodiee/screens/sepet/bottom_checkout.dart';
import 'package:foodiee/services/assets_manages.dart';
import 'package:foodiee/widgets/app_name_text.dart';
import 'package:foodiee/screens/sepet/sepet_widget.dart';
import 'package:foodiee/screens/sepet/empty_bag.dart';
import 'package:foodiee/widgets/products/product_widget.dart';
import 'package:foodiee/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ViewedRecentlyScreen extends StatelessWidget {
  static const routName = "/ViewedRecentlyScreen";

  const ViewedRecentlyScreen({super.key});
  final bool isEmpty = true;


  @override
  Widget build(BuildContext context) {
    final viewedProdProvider = Provider.of<ViewedProdProvider>(context);


    return viewedProdProvider.getViewedProds.isEmpty ?
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
            title:    Text(
          "Viewed Recently",style: TextStyle(fontSize: 25),
        ),
        ),

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
            title:  Text( "Viewed Recently ${viewedProdProvider.getViewedProds.length}",style:TextStyle(fontSize:20)),
        ),
        body: DynamicHeightGridView(
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          builder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductWidget(
                productId: viewedProdProvider.getViewedProds.values.toList()[index].productId,

              ),
            );

          },
          itemCount: viewedProdProvider.getViewedProds.length,
          crossAxisCount: 2,
        )

    );
  }
}
