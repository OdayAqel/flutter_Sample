import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final Color color;
  final double fontSize;
  final bool isTitle;
  final int maxLines;
  const CustomText({
    Key? key,
    required this.title,
    this.color = Colors.black,
    required this.fontSize,
    this.isTitle = false,
    this.maxLines = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: color,
        fontSize: fontSize,
        fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
