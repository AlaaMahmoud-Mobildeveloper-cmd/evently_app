import 'package:evently_app/core/Image_app.dart';
import 'package:evently_app/core/StringApp.dart';
import 'package:evently_app/screens/onbording_screen/widgets/itemPageview.dart';
import 'package:flutter/material.dart';

class OnboardingPageview extends StatelessWidget {
 const OnboardingPageview({super.key, required this.pageController,});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,

      children: [
        ItemPageview(
          image:ImageApp.creativeOnboarding,
          title: StringApp.titleOnboarding,
          supTitle: StringApp.supTitleOnboarding,
        ),
        ItemPageview(
          image:ImageApp.creativeOnboarding2,
          title: StringApp.titleOnboarding2,
          supTitle: StringApp.supTitleOnboarding2,
        ),
        ItemPageview(
          image:ImageApp.creativeOnboarding3,
          title: StringApp.titleOnboarding3,
          supTitle: StringApp.supTitleOnboarding3,
        ),

      ]
    );
  }
}
