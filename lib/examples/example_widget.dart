import 'package:flutter/material.dart';

class ContentBuilder {
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.brown,
    Colors.pinkAccent
  ];
  Widget buildContent(int number) {
    return Container(
      color: colors[number % colors.length],
      child: Center(child: Text(number.toString())),
    );
  }
}
