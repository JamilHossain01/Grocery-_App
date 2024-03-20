import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget(
      {super.key,
      required this.text,
      required this.color,
      required this.textSize,
      this.isTitle = false,
      this.maxlines = 10});
  final String text;
  final Color color;
  bool isTitle;
  final double textSize;
  int maxlines = 10;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxlines,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: color,
          fontSize: textSize,
          fontWeight: isTitle ? FontWeight.bold : FontWeight.normal),
    );
  }
}
