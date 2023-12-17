import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fintech/view/home_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: "images/cart.jpg",
        splashTransition: SplashTransition.slideTransition,
        nextScreen: const HomeView(),
      ),
    );
  }
}
