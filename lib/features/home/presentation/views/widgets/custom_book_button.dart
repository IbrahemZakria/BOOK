import 'package:flutter/material.dart';

class CustomBookButton extends StatelessWidget {
  const CustomBookButton({
    super.key,
    required this.buttoncolor,
    required this.child,
    this.rightRadius = 0,
    this.leftRadius = 0,
  });
  final Color buttoncolor;
  final Widget child;
  final double rightRadius;
  final double leftRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 50,
      decoration: BoxDecoration(
        color: buttoncolor,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(leftRadius),
          right: Radius.circular(rightRadius),
        ),
      ),
      child: Center(child: child),
    );
  }
}
