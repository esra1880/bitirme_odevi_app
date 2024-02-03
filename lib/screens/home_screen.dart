import 'package:card_swiper/card_swiper.dart';
import 'package:foodiee/constans/app_constans.dart';
import 'package:foodiee/providers/product_provider.dart';
import 'package:foodiee/providers/theme_provider.dart';
import 'package:foodiee/services/assets_manages.dart';
import 'package:foodiee/widgets/app_name_text.dart';
import 'package:foodiee/widgets/products/category_roundend_widget.dart';
import 'package:foodiee/widgets/products/product_widget.dart';
import 'package:foodiee/widgets/products/top_product.dart';
import 'package:foodiee/widgets/subtitle_text.dart';
import 'package:foodiee/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final productsProvider = Provider.of<ProductProvider>(context);

    Size size  = MediaQuery.of(context).size;
    return Scaffold(
      // APPBAR ------------------->
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
              AssetsManager.card,height: 80, width:80,
          ),

        ),
        title: const AppNameTextWidget(fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: size.height *0.45,
                  child: ClipRRect(
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index){
                        return Image.asset(
                          AppConstans.bannerImages[index],
                          fit:BoxFit.fill,
                        );

                      },
                      itemCount: AppConstans.bannerImages.length,
                      pagination: SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                              activeColor: Colors.red, color: Colors.grey
                          )
                      ),

                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),

                Text(
                  "Kategoriler" ,style: TextStyle(fontSize: 20),),
                const SizedBox(
                  height: 10.0,
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,


                  children:
                  List.generate(AppConstans.categoriesList.length, (index) {
                    return CategoryRoundenWidget(
                      image: AppConstans.categoriesList[index].image,
                      name: AppConstans.categoriesList[index].name,
                    );

                  }),
                ),
                const SizedBox(
                  height: 20.0,
                ),

                Visibility(visible:productsProvider.getProducts.isNotEmpty, child:
                Text(
                  "Top Product" ,style: TextStyle(fontSize: 20),),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Visibility(visible:productsProvider.getProducts.isNotEmpty,
                  child: SizedBox(
                    height: size.height* 0.2,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productsProvider.getProducts.length < 5 ? productsProvider.getProducts.length : 5,
                        itemBuilder: (context, index){
                          return ChangeNotifierProvider.value(
                            value: productsProvider.getProducts[index],
                            child: const TopProductWidget(),

                          );
                        }
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}


