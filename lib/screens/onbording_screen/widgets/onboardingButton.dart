import 'package:flutter/material.dart';

class OnboardingButton extends StatelessWidget {
   OnboardingButton({super.key,required this.titleButton ,required this.onPressed});
  final VoidCallback? onPressed;
  String? titleButton;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 60),
        padding: EdgeInsets.symmetric(vertical: 10),
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: onPressed,
      child:Text(titleButton!,
        style: TextStyle(
          fontSize: 22,
          fontWeight:FontWeight.bold,
          color: Theme.of(context).colorScheme.onPrimary
        )
      ) ,
    );
  }
}
