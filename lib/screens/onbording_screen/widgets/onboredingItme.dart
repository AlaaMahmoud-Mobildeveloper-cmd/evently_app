import 'package:evently_app/Provider/theme_provider.dart';
import 'package:evently_app/core/Image_app.dart';
import 'package:evently_app/core/StringApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key,
    required this.hadButton,
    required this.onPressed,
    required this.onPressedShip
  });
  final VoidCallback? onPressed;
  final VoidCallback? onPressedShip;
 final bool? hadButton;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Visibility(
            visible: hadButton!,
            child: IconButton(
                style: IconButton.styleFrom(
                    backgroundColor: provider.themeMode == ThemeMode.light?Theme.of(context).colorScheme.onError :Theme.of(context).colorScheme.primary ,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),

                    ),
                ),
                onPressed: onPressed,
                icon:Icon(Icons.arrow_back_ios_new,color:  provider.themeMode == ThemeMode.light?Theme.of(context).colorScheme.primary :Theme.of(context).colorScheme.onError ,)),
          ),
          Image.asset(ImageApp.logo,),
          TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: provider.themeMode == ThemeMode.light?Theme.of(context).colorScheme.onError :Theme.of(context).colorScheme.primary ,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
              ),
              onPressed: onPressedShip,
              child: Text(StringApp.skipButton,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight:FontWeight.bold,
                    color:   provider.themeMode == ThemeMode.light?Theme.of(context).colorScheme.primary :Theme.of(context).colorScheme.onError ,
                  )
              )
          )
        ]
    );
  }
}
