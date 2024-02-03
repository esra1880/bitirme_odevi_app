//ANA SAYFA KATEGORİ LİSTELERİ

import 'package:foodiee/models/categories_model.dart';
import 'package:foodiee/services/assets_manages.dart';

class AppConstans {

  static const String imageUrl =
      'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png';

  static List<String> bannerImages=[
    AssetsManager.slide1,
    AssetsManager.slide2,
    AssetsManager.slide3,
    AssetsManager.slide4,
    AssetsManager.slide5,
    AssetsManager.slide6,
    AssetsManager.slide7,
  ];
  static List<CategoriesModel> categoriesList= [
    CategoriesModel(
      id: "Pizza",
      name: "Pizza",
      image: AssetsManager.pizza,
    ),
    CategoriesModel(
      id: "Hamburger",
      name: "Hamburger",
      image: AssetsManager.hamburger,
    ),
    CategoriesModel(
      id: "Sandviç",
      name: "Sandviç",
      image: AssetsManager.sandvic,
    ),
    CategoriesModel(
      id: "Döner",
      name: "Döner",
      image: AssetsManager.doner,
    ),
    CategoriesModel(
      id: "Kebap",
      name: "Kebap",
      image: AssetsManager.kebap,
    ),
    CategoriesModel(
      id: "Tatlı",
      name: "Tatlı",
      image: AssetsManager.tatli,
    ),
    CategoriesModel(
      id: "İçecek",
      name: "İçecek",
      image: AssetsManager.icecek,
    ),
  ];
}
