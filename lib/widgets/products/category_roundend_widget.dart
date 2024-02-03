import 'package:foodiee/screens/search_screen.dart';
import 'package:foodiee/widgets/subtitle_text.dart';
import 'package:flutter/cupertino.dart';

class CategoryRoundenWidget extends StatelessWidget {
  const CategoryRoundenWidget({
    super.key,
    required this.image,
    required this.name,});

  final String image,name;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, SearchScreen.routName, arguments: name);
      },
      child: Column(
        children: [
          Image.asset(image, height: 60, width:90,),
          const SizedBox(height:10,),
          SubTitleTextWidget(label: name, fontSize: 13, fontWeight: FontWeight.w900,)
        ],
      ),


    );


  }
}
