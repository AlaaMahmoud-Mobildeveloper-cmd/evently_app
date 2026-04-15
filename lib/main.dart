import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/Provider/auth_provider.dart';
import 'package:evently_app/Provider/theme_provider.dart';
import 'package:evently_app/core/caching.dart';
import 'package:evently_app/core/theme_app.dart';
import 'package:evently_app/firebase_options.dart';
import 'package:evently_app/screens/add_event/add_event_screen.dart';
import 'package:evently_app/screens/authntaction_screens/forgetPassword/forgetPassowrd_Screen.dart';
import 'package:evently_app/screens/authntaction_screens/login/login_screen.dart';
import 'package:evently_app/screens/authntaction_screens/sign_upScreen/signUpScreen.dart';
import 'package:evently_app/screens/detils_event/detalis_event_screen.dart';
import 'package:evently_app/screens/home_screen/home_screen.dart';
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
  await CachingHelper.initial();
  runApp( EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=> ThemeProvider()),
          ChangeNotifierProvider(create: (context)=> AuthProvider())
        ],
        child: MyApp(),)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var authProvider = Provider.of<AuthProvider>(context);
    return MaterialApp(
      theme: ThemeAppData.lightTheme,
      darkTheme: ThemeAppData.darkTheme ,
      themeMode:provider.themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute: CachingHelper.getCaching("caching") == true ?
      authProvider.firebaseUser!=null
          ? HomeScreen.routeName
          : LoginScreen.routeName
          : OnboardingScreen.routeName ,
      routes: {
        LocalizeScreen.routeName: (context) =>  LocalizeScreen(),
        OnboardingScreen.routeName: (context) =>  OnboardingScreen(),
        LoginScreen.routeName: (context) =>  LoginScreen(),
        SignUpScreen.routeName: (context) =>  SignUpScreen(),
        ForgetPasswordScreen.routeName: (context) =>  ForgetPasswordScreen(),
        HomeScreen.routeName: (context) =>  HomeScreen(),
        AddEventScreen.routeName: (context) =>  AddEventScreen(),
        DetailsEventScreen.routeName: (context) =>  DetailsEventScreen(),

      },
    );
  }
}
