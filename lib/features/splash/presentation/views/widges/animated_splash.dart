import 'package:flutter/material.dart';

class AnimatedSplash extends StatelessWidget {
  final AnimationController animationController;
  final Animation<Offset> slideAnimation;

  const AnimatedSplash({
    required this.animationController,
    required this.slideAnimation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: slideAnimation.value,
          child: const Text(
            'Welcome to Book App',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
