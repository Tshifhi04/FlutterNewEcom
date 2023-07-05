import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const Buttons({super.key,required this.onPressed,required this.title, required Text child});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                  height:50,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: onPressed, child: Text(title),
                  style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),))));
  }
}