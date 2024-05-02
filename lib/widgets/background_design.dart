import 'package:flutter/material.dart';
import 'package:kazzbuzz/utils/assets.dart';

List<Widget> backgroundImages() {
  return [
    Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Opacity(
          opacity: .45,
          child: Image.asset(Assets.asteriskIcon),
        ),
      ),
    ),
    Align(
      alignment: Alignment.topLeft,
      child: Image.asset(Assets.topLeftIcon),
    ),
    Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 0, 50),
        child: Image.asset(Assets.circleIcon),
      ),
    ),
    Align(
      alignment: Alignment.bottomRight,
      child: Image.asset(Assets.bottomRightIcon),
    ),
    Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 50),
        child: Image.asset(Assets.smallCircleIcon),
      ),
    ),
    Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 30, bottom: 220),
        child: Image.asset(Assets.circleIcon),
      ),
    ),
    Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, bottom: 70),
        child: Image.asset(Assets.smallCircleIcon),
      ),
    ),
    const Row(),
    const Column(),
  ];
}
