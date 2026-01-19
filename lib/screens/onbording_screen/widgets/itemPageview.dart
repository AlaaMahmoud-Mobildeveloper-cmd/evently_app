import 'package:evently_app/Provider/theme_provider.dart';
import 'package:evently_app/core/style_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemPageview extends StatelessWidget {
  String image;
  String title;
  String supTitle;
   ItemPageview({super.key
     ,required this.image
     ,required this.title
     ,required this.supTitle});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          ImageIcon(AssetImage(image),
      size: 400,
      color:provider.themeMode == ThemeMode.light?Theme.of(context).colorScheme.primary :Theme.of(context).colorScheme.onError ,

          ),
          SizedBox(height: 15,),
          Text(title,
            textAlign: TextAlign.start,
            style:StyleApp.titleStyleLocalize.
          copyWith(color:Theme.of(context).colorScheme.primary ) ,),
          Text(supTitle,style:StyleApp.descriptionStyleLocalize.
          copyWith(color:Theme.of(context).colorScheme.secondary ) ,),
        ],
      ),
    );
  }
}
