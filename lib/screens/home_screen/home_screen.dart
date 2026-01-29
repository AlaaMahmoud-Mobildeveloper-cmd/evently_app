import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/Provider/auth_provider.dart';
import 'package:evently_app/Provider/hom_provider.dart';
import 'package:evently_app/Provider/theme_provider.dart';
import 'package:evently_app/core/Image_app.dart';
import 'package:evently_app/core/StringApp.dart';
import 'package:evently_app/screens/add_event/add_event_screen.dart';
import 'package:evently_app/screens/home_screen/tabs/favorit_tab.dart';
import 'package:evently_app/screens/home_screen/tabs/home_tab.dart';
import 'package:evently_app/screens/home_screen/tabs/profil_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context)=> HomeProvider(),
      builder: (context, child){
        var provider = Provider.of<HomeProvider>(context);
        var themeProvider = Provider.of<ThemeProvider>(context);
        var authProvider = Provider.of<AuthProvider>(context);
        return  Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title:provider.selectedIndex==0 ? ListTile(
              title: Text( "welcome".tr(),
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary
                ),
              ),
              subtitle: Text(authProvider.userModel?.name ?? "",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurfaceVariant
                  )
              ),
            ):SizedBox(),
            actions: [
              provider.selectedIndex==0 ?IconButton(onPressed: (){
                if(themeProvider.themeMode == ThemeMode.light){
                  themeProvider.changeTheme(ThemeMode.dark);
                }else{
                  themeProvider.changeTheme(ThemeMode.light);
                }
              }, icon:Icon(themeProvider.themeMode == ThemeMode.light?Icons.dark_mode:Icons.light_mode,
                color: Theme.of(context).colorScheme.primary,
                size: 35,

              )):SizedBox(),
              provider.selectedIndex==0 ? GestureDetector(
                onTap: (){
                  if (context.locale.languageCode == 'en') {
                    context.setLocale(const Locale('ar', 'EG')); // تغيير للعربي
                  } else {
                    context.setLocale(const Locale('en', 'US')); // تغيير للإنجليزي
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(context.locale.languageCode == 'en' ?"En":"Ar",
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onPrimary
                      )
                  ),
                ),
              ):SizedBox()
            ],
          ),
          body: tabs[provider.selectedIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: themeProvider.themeMode == ThemeMode.light
                  ?Theme.of(context).colorScheme.onError
                  : Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )
            ),
            child: BottomNavigationBar(
                currentIndex: provider.selectedIndex,
                onTap: (index){
                  provider.changeSelectIndex(index);
                },

                items: [
                  BottomNavigationBarItem(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      icon: ImageIcon(AssetImage(provider.selectedIndex == 0
                          ?ImageApp.homeSelected
                          :ImageApp.home)),label: "home".tr()),
                  BottomNavigationBarItem(icon:ImageIcon(AssetImage(provider.selectedIndex == 1
                      ? ImageApp.favoriteSelected
                      :ImageApp.favorite)),label: "favorite".tr()),
                  BottomNavigationBarItem(icon: ImageIcon(AssetImage(provider.selectedIndex == 2
                      ? ImageApp.userNameSelected
                      :ImageApp.userName)),label: "profile".tr()),
                ]
            ),
          ),
          floatingActionButton:FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            onPressed: (){
              Navigator.pushNamed(context, AddEventScreen.routeName);
            },
            child: Icon(Icons.add,
              size: 35,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        );
      },
    );
  }
  List<Widget> tabs =[
    HomeTab(),
    FavoriteTab(),
    ProfileTab(),
  ];
}
