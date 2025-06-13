import 'package:book/core/utils/styels.dart';
import 'package:flutter/material.dart';

class CustomeText extends StatelessWidget {
  const CustomeText({
    super.key,
    required this.text,
    this.textStyle = Styles.textStyle18,
    this.maxLines = 3,
  });
  final TextStyle textStyle;
  final String text;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Text(
        text,
        style: textStyle,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
