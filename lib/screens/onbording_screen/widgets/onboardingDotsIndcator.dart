import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
class DotIndicator extends StatelessWidget {
   const DotIndicator({super.key, required this.currentPage});
  final double currentPage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
         width: double.infinity,
          child: DotsIndicator(
            dotsCount: 3,
            position: currentPage,
            decorator: DotsDecorator(
              activeColor: Theme.of(context).colorScheme.primary,
              color: Theme.of(context).colorScheme.secondary,
              activeSize: Size(35, 12),
              size:  Size(12, 12),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),

            )
          ),


    );

  }
}
