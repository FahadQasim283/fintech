import 'dart:math' show pi;
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _MyAppState();
}
class _MyAppState extends State<HomeView> with SingleTickerProviderStateMixin {
  bool animate = true;
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(controller);
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 75, 52, 52),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: AnimatedBuilder(
            animation: animation, builder: (context, child) => Square(value: animation.value,))),
          Center(child: AnimatedBuilder(
            animation: animation, builder: (context, child) => Square(value: -animation.value,))),
          Center(child: AnimatedBuilder(
            animation: animation, builder: (context, child) => Square(value: animation.value,))),
        ],
      ),
    );
  }
}

class Square extends StatelessWidget {
 final double value;
  const Square({required this.value,super.key});
  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.bottomCenter,
      transform: Matrix4.identity()..rotateZ(value),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: const Color(0xff67549B),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ]),
      ),
    );
  }
}
