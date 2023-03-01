import 'package:flutter/material.dart';

class OverflowTextWidget extends StatelessWidget {
  const OverflowTextWidget({
    required this.text,
    this.style,
    super.key,
  });

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) => Text(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text,
        style: style,
      );
}
