import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/Image_app.dart';
import 'package:evently_app/core/StringApp.dart';
import 'package:evently_app/core/colorsApp.dart';
import 'package:evently_app/core/style_app.dart';
import 'package:evently_app/screens/onbording_screen/onboredingScreen.dart';
import 'package:flutter/material.dart';

class LocalizeScreen extends StatelessWidget {
  static const String routeName = '/localize';

  const LocalizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:Image.asset(ImageApp.logo),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 30,
          children: [
            Image.asset(ImageApp.creative,fit: BoxFit.cover,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text("onboardTitle".tr(),style: StyleApp.titleStyleLocalize.copyWith(
                    color: Theme.of(context).colorScheme.primary
                ),),
                Text("onboardText".tr(),style: StyleApp.descriptionStyleLocalize.copyWith(
                    color: Theme.of(context).colorScheme.secondary
                ),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("lung".tr(),
                  style: StyleApp.titleStyleLocalize.copyWith(
                      color: Theme.of(context).colorScheme.primary
                  ),),
                Row(
                  spacing: 6,
                  children: [
                    InkWell(
                      onTap: (){
                        context.setLocale(Locale('en', 'US'));
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical:7,horizontal: 16),
                          decoration: BoxDecoration(
                             color: context.locale == Locale('en', 'US')? Theme.of(context).colorScheme.primary:Theme.of(context).colorScheme.onError,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(StringApp.en,
                            textAlign: TextAlign.center,
                            style: StyleApp.titleStyleLocalize.
                            copyWith(
                              color:context.locale == Locale('ar', 'EG')? Theme.of(context).colorScheme.primary:Theme.of(context).colorScheme.onError,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ))
                          ),
                    ),
                    InkWell(
                      onTap: (){
                        context.setLocale(Locale('ar', 'EG'));
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical:7,horizontal: 16),
                          decoration: BoxDecoration(
                            color:context.locale == Locale('ar', 'EG')? Theme.of(context).colorScheme.primary:Theme.of(context).colorScheme.onError,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(StringApp.ar,
                            textAlign: TextAlign.center,
                            style: StyleApp.titleStyleLocalize.
                            copyWith(
                              color:context.locale == Locale('ar', 'EG')? Theme.of(context).colorScheme.onError: Theme.of(context).colorScheme.primary ,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ))
                          ),
                    ),

                  ]
                )
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("theme".tr(),style: StyleApp.titleStyleLocalize.copyWith(
                  color: Theme.of(context).colorScheme.primary
                ),),
                Row(
                  spacing: 6,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(vertical:7,horizontal: 16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary ,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ImageIcon(AssetImage(ImageApp.lightMode),color:Theme.of(context).colorScheme.onError,size: 30,)
                        ),
                    Container(
                        padding: EdgeInsets.symmetric(vertical:7,horizontal: 16),
                        decoration: BoxDecoration(
                          color:  Theme.of(context).colorScheme.onError,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  ImageIcon(AssetImage(ImageApp.darkMode),color:Theme.of(context).colorScheme.primary,size: 30,)
                        ),

                  ]
                )
              ]
            ),
            SizedBox(height: 5,),
            ElevatedButton(

              onPressed: () {
                Navigator.pushNamed(context, OnboardingScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10),
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
            ),
              child: Text("letsGo".tr()
                  ,style: StyleApp.titleStyleLocalize.
                  copyWith(
                      color: Theme.of(context).colorScheme.onPrimary
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
