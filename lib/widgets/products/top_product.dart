

import 'dart:developer';

import 'package:foodiee/constans/app_constans.dart';
import 'package:foodiee/models/product_model.dart';
import 'package:foodiee/providers/sepet_provider.dart';
import 'package:foodiee/providers/viewed_recently_providers.dart';
import 'package:foodiee/widgets/products/kalp_btn.dart';
import 'package:foodiee/widgets/products/product_details.dart';
import 'package:foodiee/widgets/subtitle_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class TopProductWidget extends StatelessWidget {
  const TopProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size  = MediaQuery.of(context).size;
    final cartProvider = Provider.of<SepetProvider>(context);
    final productsModel = Provider.of<ProductModel>(context);
    final viewedProvider = Provider.of<ViewedProdProvider>(context);


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async{
          viewedProvider.addViewProd(productId: productsModel.productId);

          await Navigator.pushNamed(context, ProductDetailScreen.routName, arguments:productsModel.productId );
        },
        child:  SizedBox(
          width: size.width*0.45,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: FancyShimmerImage(
                    imageUrl: productsModel.productImage,
                    height: size.width * 0.24,
                    width: size.width*0.32,
                  ),

                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Flexible(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        productsModel.productTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      FittedBox(
                        child: Row(
                          children: [
                            IconButton(onPressed: () {},
                              icon: KalpButtonWidget(productId:productsModel.productId ),
                            ),
                            IconButton(onPressed: () {

                              if(cartProvider.isProdinCart(
                                  productId: productsModel.productId))
                              {
                                return;
                              }
                              cartProvider.addProductCart(productId: productsModel.productId);



                            },
                              icon:  Icon(
                                  cartProvider.isProdinCart(
                                      productId: productsModel.productId)
                                      ? Icons.check
                                      : Icons.shopping_cart_outlined),
                            ),
                          ],
                        ),
                      ),
                      FittedBox(
                        child: SubTitleTextWidget(
                          label: "\₺ ${productsModel.productPrice}",
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                      )
                    ],
                  )
              )

            ],

          ),
        ),

      ),
    );
  }
}
