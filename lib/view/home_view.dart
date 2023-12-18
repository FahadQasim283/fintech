import 'dart:math' show pi;
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _MyAppState();
}
class _MyAppState extends State<HomeView> with TickerProviderStateMixin {
  bool animate = true;
  late AnimationController controller1;
  late AnimationController controller2;
  late AnimationController controller3;

  late Animation animation1;
  late Animation animation2;
  late Animation animation3;

  @override
  void initState() {
    super.initState();
    controller1 = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation1 = Tween<double>(begin: 0.0, end: 2 * pi).animate(controller1);
    controller1.repeat();

    controller2 = AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animation2 = Tween<double>(begin: 0.0, end: 2 * pi).animate(controller2);
    controller2.repeat();

    controller3 = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation3 = Tween<double>(begin: 0.0, end: 2 * pi).animate(controller3);
    controller3.repeat();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
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
            animation: animation1, builder: (context, child) => Square(value: animation1.value,))),
          Center(child: AnimatedBuilder(
            animation: animation2, builder: (context, child) => Square(value: animation2.value,))),
          Center(child: AnimatedBuilder(
            animation: animation3, builder: (context, child) => Square(value: animation3.value,))),
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
