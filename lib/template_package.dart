library template_package;

import 'dart:math';

import 'package:flutter/material.dart';


class AnimatedCircle extends StatefulWidget {
  const AnimatedCircle({Key? key}) : super(key: key);

  @override
  State<AnimatedCircle> createState() => _AnimatedCircleState();
}

class _AnimatedCircleState extends State<AnimatedCircle> with SingleTickerProviderStateMixin{
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,lowerBound: 0,upperBound: pi,duration: const Duration(seconds: 2));
    _animationController.forward();
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _animationController, builder: (BuildContext context, Widget? child){
      return Container(
        height: 100*sin(_animationController.value),
        width: 100*sin(_animationController.value),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.yellow
        ),
      );
    });
  }
}
