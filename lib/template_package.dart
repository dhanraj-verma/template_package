library template_package;

import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedCircle extends StatefulWidget {
  const AnimatedCircle({Key? key}) : super(key: key);

  @override
  State<AnimatedCircle> createState() => _AnimatedCircleState();
}

class _AnimatedCircleState extends State<AnimatedCircle>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: pi,
        duration: const Duration(seconds: 2));
    _animationController.forward();
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return Container(
            height: 100 * sin(_animationController.value),
            width: 100 * sin(_animationController.value),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: _RandomColorGenerator.generate),
          );
        });
  }
}

class _RandomColorGenerator {
  static final _random = Random();
  static Color get generate {
    return Color.fromRGBO(
        _random.nextInt(255), _random.nextInt(255), _random.nextInt(255), 1);
  }
}
