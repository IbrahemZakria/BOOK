import 'package:flutter/material.dart';

class CustomErrorText extends StatelessWidget {
  const CustomErrorText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text, textAlign: TextAlign.center));
  }
}
