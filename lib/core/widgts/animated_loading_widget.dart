import 'package:flutter/material.dart';

class AnimatedLoadingWidget extends StatefulWidget {
  const AnimatedLoadingWidget({super.key, required this.widget});
  final Widget widget;

  @override
  State<AnimatedLoadingWidget> createState() => _AnimatedLoadingWidgetState();
}

class _AnimatedLoadingWidgetState extends State<AnimatedLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // AnimationController بيحدد مدة الحركة
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..repeat(
            reverse: true,
          ); // عشان يعيد نفسه في الاتجاه المعاكس (يعني يطفي ويشتغل بلين ناعم)

    // Animation بسيطة بتغير الشفافية (Opacity)
    _animation = Tween<double>(begin: 0.4, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); // دا مهم عشان ما يحصلش memory leak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(opacity: _animation, child: widget.widget),
    );
  }
}
