import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/Image_app.dart';
import 'package:evently_app/core/firebase_functions.dart';
import 'package:evently_app/core/style_app.dart';
import 'package:evently_app/screens/authntaction_screens/login/login_screen.dart';
import 'package:evently_app/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signUp';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isObscured = true;
  bool _isObscuredConfirm = true;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
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
                      return "Please enter your name".tr();
                    }
                    return null;
                  },
                  style: TextStyle(
                    fontSize:  20,
                    color: Theme.of(context).colorScheme.primary
                ),
                  controller: nameController,
                    decoration: InputDecoration(
                      hintText: "name".tr(),
                      helperStyle: StyleApp.descriptionStyleLocalize,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color:Theme.of(context).colorScheme.onError )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color:Theme.of(context).colorScheme.onError )
                      ),
                      prefixIcon:ImageIcon(AssetImage(ImageApp.userName)),
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
                    style: TextStyle(
                        fontSize:  20,
                        color: Theme.of(context).colorScheme.primary
                    ),
                    controller: emailController,
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
                      final bool passwordValid =
                      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value);
                      if (!passwordValid) {
                        return "Please enter a valid email".tr();
                      }
                      return null;
                    },
                    style: TextStyle(
                        fontSize:  20,
                        color: Theme.of(context).colorScheme.primary
                    ),
                  controller: passwordController,
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

                      )
                        ,
                      prefixIcon: ImageIcon(AssetImage(ImageApp.password)),
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
                        return "Please enter your Confirm password".tr();
                      }else if(value != passwordController.text){
                        return "Password not match".tr();
                      }
                      return null;
                    },
                    style: TextStyle(
                        fontSize:  20,
                        color: Theme.of(context).colorScheme.primary
                    ),
                  controller: confirmPasswordController,
                    obscureText: _isObscuredConfirm,
                    decoration: InputDecoration(
                      hintText: "confirmPassword".tr(),
                      helperStyle: StyleApp.descriptionStyleLocalize,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color:Theme.of(context).colorScheme.onError )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color:Theme.of(context).colorScheme.onError )
                      ),
                      suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              _isObscuredConfirm = !_isObscuredConfirm;
                            });
                          },
                          icon:Icon(
                              _isObscuredConfirm==true?Icons.visibility_off:Icons.visibility,
                              color: Theme.of(context).colorScheme.secondary
                          )

                          )
                      ,
                      prefixIcon: ImageIcon(AssetImage(ImageApp.password)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular( 6),
                          borderSide: BorderSide(color:Theme.of(context).colorScheme.onError )
                      ),
                      fillColor:Theme.of(context).colorScheme.onError ,
                      filled: true,
                    )
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
                    if(formKey.currentState!.validate()){
                      FirebaseFunction.createUser(
                          emailController.text,
                          passwordController.text,
                          nameController.text,
                          onSuccess: (){
                            Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                          },
                          onError: (message){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Theme.of(context).colorScheme.onError,
                                content: Text(message,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).colorScheme.error
                                  ),
                                ),
                              ),

                            );
                          }
                      )
                      ;
                    }

                  },
                  child:Text( "signUp".tr()
                      ,style: StyleApp.titleStyleLocalize.
                      copyWith(
                          color: Theme.of(context).colorScheme.onPrimary
                      )
                  ),

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( "Already".tr(),style: StyleApp.descriptionStyleLocalize.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant
                    ),),
                    TextButton(
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                        },
                        child: Text("login".tr(),style: StyleApp.titleStyleLocalize.copyWith(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary
                        ),)
                    )

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("or".tr(),textAlign: TextAlign.center,style: StyleApp.descriptionStyleLocalize.copyWith(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary
                    ),),

                  ],
                ),
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
                          Text( "SignGoogle".tr(),
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
        )
    );
  }
}
