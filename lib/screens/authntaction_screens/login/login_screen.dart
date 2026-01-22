import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/Image_app.dart';
import 'package:evently_app/core/firebase_functions.dart';
import 'package:evently_app/core/style_app.dart';
import 'package:evently_app/screens/authntaction_screens/forgetPassword/forgetPassowrd_Screen.dart';
import 'package:evently_app/screens/authntaction_screens/sign_upScreen/signUpScreen.dart';
import 'package:evently_app/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscured = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Form(
            key:formKey ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 20,
              children: [
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImageApp.logo),
                  ],
                ),
                SizedBox(height: 30,),
                TextFormField(
                    validator: (value){
                      if(value == null ||value.isEmpty ){
                        return "Please enter your email".tr();
                      }
                      final bool emailValid =
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (!emailValid) {
                        return "Please enter a valid email".tr();
                      }
                      return null;
                    },
                  controller:emailController ,
                  style: TextStyle(
                    fontSize:  20,
                    color: Theme.of(context).colorScheme.primary
                  ),
                  decoration: InputDecoration(
                    hintText: "email".tr(),
                    helperStyle: StyleApp.descriptionStyleLocalize,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color:Theme.of(context).colorScheme.onError )
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color:Theme.of(context).colorScheme.onError )
                    ),
                    prefixIcon:ImageIcon(AssetImage(ImageApp.email)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular( 6),
                      borderSide: BorderSide(color:Theme.of(context).colorScheme.onError )
                  ),
                    fillColor:Theme.of(context).colorScheme.onError ,
                    filled: true,
                  )
                ),
                TextFormField(
                  validator: (value){
                    if(value == null ||value.isEmpty ){
                      return "Please enter your password".tr();
                    }
                    return null;
                  },
                  controller:passwordController ,
                  style: TextStyle(
                    fontSize:  20,
                    color: Theme.of(context).colorScheme.primary
                  ),
                  obscureText: _isObscured,
                  decoration: InputDecoration(
                    hintText: "password".tr(),
                    helperStyle: StyleApp.descriptionStyleLocalize,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color:Theme.of(context).colorScheme.onError )
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color:Theme.of(context).colorScheme.onError )
                    ),
                    suffixIcon:  IconButton(
                        onPressed: (){
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                        icon:Icon(
                            _isObscured==true?Icons.visibility_off:Icons.visibility,
                            color: Theme.of(context).colorScheme.secondary
                        )

                    ),
                    prefixIcon: ImageIcon(AssetImage(ImageApp.password)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular( 6),
                      borderSide: BorderSide(color:Theme.of(context).colorScheme.onError )
                  ),
                    fillColor:Theme.of(context).colorScheme.onError ,
                    filled: true,
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, ForgetPasswordScreen.routeName);
                        },
                        child: Text( "forgetPassword".tr(),
                          textAlign: TextAlign.end,
                          style: StyleApp.titleStyleLocalize.copyWith(
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.primary
                        ),)
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    minimumSize: Size(double.infinity, 60),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: EdgeInsets.symmetric(vertical: 10)
                  ),
                  onPressed: (){
                    if(formKey.currentState!.validate()) {
                      FirebaseFunction.login(
                          emailController.text,
                          passwordController.text,
                          onSuccess: () {
                            Navigator.pushReplacementNamed(
                                context, HomeScreen.routeName);
                          }
                          , onError: (message) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          SnackBar(
                            backgroundColor: Theme
                                .of(context)
                                .colorScheme
                                .onError,
                            content: Text(message,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .error
                              ),
                            ),
                          ),
                        );
                      }
                      );
                    }
                  },
                  child:Text( "login".tr()
                  ,style: StyleApp.titleStyleLocalize.
                  copyWith(
                      color: Theme.of(context).colorScheme.onPrimary
                  )
                  ),

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( "notAccount".tr(),style: StyleApp.descriptionStyleLocalize.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant
                    ),),
                    TextButton(
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, SignUpScreen.routeName);
                        },
                        child: Text( "signUp".tr(),style: StyleApp.titleStyleLocalize.copyWith(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary
                        ),)
                    )

                  ],
                ),
                Text("or".tr(),textAlign: TextAlign.center,style: StyleApp.descriptionStyleLocalize.copyWith(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.primary
                ),),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      minimumSize: Size(double.infinity, 60),
                      backgroundColor: Theme.of(context).colorScheme.onError,
                    ),
                    onPressed: (){
                      FirebaseFunction.signInWithGoogle()
                          .then((value) {
                        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImageApp.loginGoogle),
                        SizedBox(width: 10,),
                        Text( "loginGoogle".tr(),
                        style: StyleApp.titleStyleLocalize.
                        copyWith(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.primary
                        ),
                        )
                      ]
                    ))
              ],
            ),
          ),
        ),

    );
  }
}
