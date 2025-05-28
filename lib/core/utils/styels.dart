import 'package:book/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  static const TextStyle titleMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: kwhitecolor, // kprimarycolor
  );
  static const TextStyle numberStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: kwhitecolor, // kprimarycolor
  );
  static const TextStyle smallcontent = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );
}
