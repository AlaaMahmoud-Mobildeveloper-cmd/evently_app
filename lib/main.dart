import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/Provider/theme_provider.dart';
import 'package:evently_app/core/theme_app.dart';
import 'package:evently_app/firebase_options.dart';
import 'package:evently_app/screens/localizing_screen/localizeScreen.dart';
import 'package:evently_app/screens/onbording_screen/onboredingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child:  ChangeNotifierProvider(
          create: (context)=> ThemeProvider(),
          child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: ThemeAppData.lightTheme,
      darkTheme: ThemeAppData.darkTheme ,
      themeMode:provider.themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute: LocalizeScreen.routeName ,
      routes: {
        LocalizeScreen.routeName: (context) =>  LocalizeScreen(),
        OnboardingScreen.routeName: (context) =>  OnboardingScreen(),
      },
    );
  }
}
