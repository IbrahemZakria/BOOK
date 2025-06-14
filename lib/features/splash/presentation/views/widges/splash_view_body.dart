import 'package:book/core/utils/assets.dart';
import 'package:book/features/home/presentation/views/home_views.dart';
import 'package:book/features/splash/presentation/views/widges/animated_splash.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

late AnimationController animationController;
late Animation<Offset> slideAnimation;

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  void initSlidinganmation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slideAnimation =
        Tween<Offset>(begin: const Offset(0, 100), end: Offset.zero).animate(
          CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
        );
    animationController.forward();
  }

  @override
  void initState() {
    super.initState();
    initSlidinganmation();
    splashNavigation();
  }

  void splashNavigation() {
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, HomeViews.routeName);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsData.logo),
            const SizedBox(height: 10),
            AnimatedSplash(
              animationController: animationController,
              slideAnimation: slideAnimation,
            ),
          ],
        ),
      ),
    );
  }
}
