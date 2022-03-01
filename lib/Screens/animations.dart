import 'package:flutter/material.dart';

class MyAnimation {
  late final AnimationController controller;
  late final Animation<double> sizeanimation;
  late final Animation<double> opanimation;

  MyAnimation({required this.controller})
      : sizeanimation = Tween(begin: 0.0, end: 400.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.000, 0.999, curve: Curves.decelerate),
          ),
        ),
        opanimation = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.000, 0.799, curve: Curves.fastOutSlowIn),
          ),
        );
}
