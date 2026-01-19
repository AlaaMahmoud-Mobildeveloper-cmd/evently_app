
import 'package:evently_app/core/StringApp.dart';
import 'package:evently_app/core/caching.dart';
import 'package:evently_app/screens/authntaction_screens/login/login_screen.dart';
import 'package:evently_app/screens/onbording_screen/widgets/onboardingButton.dart';
import 'package:evently_app/screens/onbording_screen/widgets/onboardingDotsIndcator.dart';
import 'package:evently_app/screens/onbording_screen/widgets/onboardingPageView.dart';
import 'package:evently_app/screens/onbording_screen/widgets/onboredingItme.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/onboarding';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
   PageController? pageController;
   @override
  void initState() {
    pageController = PageController(
        initialPage: 0
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double currentPage = 0;
    if (pageController!.hasClients) {
      currentPage = pageController!.page ?? 0;
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        alignment: Alignment.center,
        children: [

          OnboardingPageview(
            pageController: pageController!,
          ),
          Positioned(
              top: 80,
              left: 0,
              right: 0,
              child:OnboardingItem(
                onPressed: () {
                  if(currentPage.round() > 0){
                    pageController!.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }

                },
                hadButton: (pageController?.hasClients ?? false)
                    ? (pageController!.page!.round() >= 1)
                    : false,
                onPressedShip: () async{
                  await CachingHelper.saveCaching(true);
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
              )
          ),
          Positioned(
            bottom: 420,
            left:10,
            right: 10,
            child:DotIndicator(
              currentPage: currentPage,
            )
          ),
          Positioned(
            bottom: 50,
            left: 25,
            right: 25,
            child:OnboardingButton(
              onPressed: () async{
                if (currentPage.round() < 2) {
                  pageController!.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  await CachingHelper.saveCaching(true);
                  Navigator.pushNamed(context, LoginScreen.routeName);
                }
              },
              titleButton:currentPage.round() ==2 ? StringApp.getStartButton : StringApp.nextButton,
            ),
          )
        ]
      ),
    );
  }
}
