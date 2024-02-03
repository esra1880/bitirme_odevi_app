//ANASAYFA ÜRÜN DETAY



import 'package:foodiee/constans/app_constans.dart';
import 'package:foodiee/providers/sepet_provider.dart';
import 'package:foodiee/widgets/app_name_text.dart';
import 'package:foodiee/widgets/products/kalp_btn.dart';
import 'package:foodiee/widgets/subtitle_text.dart';
import 'package:foodiee/widgets/title_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodiee/providers/product_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routName = "/ProductDetailScreen";
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<SepetProvider>(context);
    final productsProvider = Provider.of<ProductProvider>(context);
    String? productId = ModalRoute.of(context)!.settings.arguments as String?;
    final getCurrProduct = productsProvider.findByProId(productId!);
    Size size  = MediaQuery.of(context).size;
    return Scaffold(
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
        title: const AppNameTextWidget(fontSize: 20,),
      ),
      body: getCurrProduct == null
          ? const SizedBox.shrink()
          : SingleChildScrollView(
        child: Column(
          children: [
            FancyShimmerImage(
              imageUrl: getCurrProduct.productImage,
              height: size.height * 0.35,
              width: double.infinity,

            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                              getCurrProduct.productTitle,
                              softWrap: true,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SubTitleTextWidget(
                          label: "\₺ ${getCurrProduct.productPrice}",
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.red,
                        )

                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          KalpButtonWidget(
                            productId: getCurrProduct.productId,
                            bkgColor: Color(0xFFFFDE59),

                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: kBottomNavigationBarHeight-10,
                              child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0)
                                    ),
                                  ) ,
                                  onPressed: (){

                                    if(cartProvider.isProdinCart(
                                        productId: getCurrProduct.productId))
                                    {
                                      return;
                                    }

                                    cartProvider.addProductCart(productId: getCurrProduct.productId);

                                  },
                                  icon:  Icon(
                                      cartProvider.isProdinCart(
                                          productId: getCurrProduct.productId)
                                          ? Icons.check
                                          : Icons.shopping_cart_outlined),

                                  label: Text(

                                      cartProvider.isProdinCart(
                                          productId: getCurrProduct.productId)
                                          ?"In cart"
                                          :"Add to cart"


                                  )
                              ),
                            ),

                          ),
                        ],


                      ),


                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text(
                            "Ürün Hakkında ",style: TextStyle(fontSize: 20),
                        ),
                        SubTitleTextWidget(
                          label: "  ${getCurrProduct.productCategory} Kategorisi",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SubTitleTextWidget(label: getCurrProduct.productDescription, fontSize: 19.0)

                  ],
                )
            ),
          ],
        ),

      ),
    );
  }
}

