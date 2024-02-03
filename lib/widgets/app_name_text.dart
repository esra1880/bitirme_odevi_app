import 'package:foodiee/widgets/title_text.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class AppNameTextWidget extends StatelessWidget {
  const AppNameTextWidget({super.key, this.fontSize=30});

  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 12),
      baseColor: Color(0xFFFFDE59),
      highlightColor: Color(0xFFC93226),
      child: TitleTextWidget(label: "Foodie App",
      fontSize: 23,fontWeight: FontWeight.bold,
      ),

    );
  }
}
