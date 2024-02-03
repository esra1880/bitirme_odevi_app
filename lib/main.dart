import 'package:firebase_core/firebase_core.dart';
import 'package:foodiee/constans/theme_data.dart';
import 'package:foodiee/providers/product_provider.dart';
import 'package:foodiee/providers/sepet_provider.dart';
import 'package:foodiee/providers/theme_provider.dart';
import 'package:foodiee/providers/user_provider.dart';
import 'package:foodiee/providers/viewed_recently_providers.dart';
import 'package:foodiee/providers/wishlist_provider.dart';
import 'package:foodiee/root_screen.dart';
import 'package:foodiee/screens/auth/forgot_password.dart';
import 'package:foodiee/screens/auth/login.dart';
import 'package:foodiee/screens/auth/register.dart';
import 'package:foodiee/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:foodiee/screens/init_screen/viewed_recently.dart';
import 'package:foodiee/screens/init_screen/wishlist.dart';
import 'package:foodiee/screens/search_screen.dart';
import 'package:foodiee/screens/sepet/checkout_page.dart';
import 'package:foodiee/screens/splash_screen.dart';
import 'package:foodiee/widgets/order/order_screen.dart';
import 'package:foodiee/widgets/products/product_details.dart';
import 'package:provider/provider.dart';




void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>
      (future: Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyBzscMXMyZ1BCsARB2HepVfQUVxrqoWvPw',
          appId: '1:311781754479:android:9a84c5526d05bfd2866f9a',
          messagingSenderId: '311781754479',
          projectId: 'foodiee-4662d',
          storageBucket: 'foodiee-4662d.appspot.com',
        )
    ),
        builder: (context, snapshot){
          if(snapshot.connectionState== ConnectionState.waiting){
            return const MaterialApp(
                debugShowCheckedModeBanner: false,
                home:Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
            );
          }
          else if(snapshot.hasError){
            return  MaterialApp(
                debugShowCheckedModeBanner: false,
                home:Scaffold(
                  body: Center(
                    child: SelectableText(snapshot.error.toString()),
                  ),
                )
            );

          }




          return MultiProvider(providers: [
            ChangeNotifierProvider(create: (_){
              return ThemeProvider();
            }),
            ChangeNotifierProvider(create: (_){
              return ProductProvider();
            }),
            ChangeNotifierProvider(create: (_){
              return SepetProvider();
            }),
            ChangeNotifierProvider(create: (_){
              return WishlistProvider();
            }),
            ChangeNotifierProvider(create: (_){
              return ViewedProdProvider();
            }),
            ChangeNotifierProvider(create: (_){
              return UserProvider();
            }),

          ],
            child: Consumer<ThemeProvider>(builder: (context, themeProvider, child){
              return MaterialApp(
                title: 'Foodie App ',
                theme: Styles.themeData(isDarkTheme: themeProvider.getIsDarkTheme, context: context),

                home:const SplashScreen(),
                //    home:const RootScreen(),
                routes: {
                  ProductDetailScreen.routName : (context)=> const ProductDetailScreen(),
                  RootScreen.routName : (context)=> const RootScreen(),
                  WishlistScreen.routName : (context)=> const WishlistScreen(),
                  ViewedRecentlyScreen.routName : (context)=> const ViewedRecentlyScreen(),
                  RegisterScreen.routName : (context)=> const RegisterScreen(),
                  OrderScreen.routName : (context)=> const OrderScreen(),
                  ForgotPassword.routName : (context)=> const ForgotPassword(),
                  SearchScreen.routName : (context)=> const SearchScreen(),
                  LoginScreen.routName : (context)=> const LoginScreen(),


                },
                debugShowCheckedModeBanner: false, // debug yazısını kaldırmak için bu satırı ekledik

              );


            }),

          );
        }
    );
  }
}
