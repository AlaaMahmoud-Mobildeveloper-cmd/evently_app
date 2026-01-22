import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/Provider/theme_provider.dart';
import 'package:evently_app/core/Image_app.dart';
import 'package:evently_app/core/style_app.dart';
import 'package:evently_app/screens/authntaction_screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = '/forgetPassword';
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
          backgroundColor:Colors.transparent,
        title: Text('forgetPassword'.tr(),
          style: StyleApp.titleStyleLocalize.copyWith(
              color:Theme.of(context).colorScheme.primary
          )
        ),
        leading:IconButton(
            style: IconButton.styleFrom(
              backgroundColor: provider.themeMode == ThemeMode.light?Theme.of(context).colorScheme.onError :Theme.of(context).colorScheme.primary ,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),

              ),
            ),
            onPressed: (){
              Navigator.pushNamed(context, LoginScreen.routeName);
            },
            icon:Icon(Icons.arrow_back_ios_new,color:  provider.themeMode == ThemeMode.light?Theme.of(context).colorScheme.primary :Theme.of(context).colorScheme.onError ,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          spacing: 26,
          children: [
            ImageIcon(AssetImage(ImageApp.resetPassword),
              color: provider.themeMode == ThemeMode.light
                  ?Theme.of(context).colorScheme.primary
                  :Theme.of(context).colorScheme.onError ,
              size: 440,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  minimumSize: Size(double.infinity, 60),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  padding: EdgeInsets.symmetric(vertical: 10)
              ),
              onPressed: (){},
              child:Text( "reset".tr()
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
