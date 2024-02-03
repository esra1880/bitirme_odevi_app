import 'package:flutter/material.dart';

import 'package:foodiee/screens/auth/login.dart';





//import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(final BuildContext context) {

    // bool isRedTheme = Theme.of(context).brightness == Brightness.dark;


    return Center(
      child: Hero(
        tag: "logo",
        child: Image.asset(
            "assets/images/acılıs.gif", fit: BoxFit.cover,width:430,height:900
          /*color:const Color(   0xFFDF0000),,*/
        ),
      ),


    );
  }

  @override
  void initState() {
    Future<void>.delayed(const Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
    super.initState();
  }
}