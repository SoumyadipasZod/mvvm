import 'package:flutter/material.dart';

final List<BoxShadow> commonCardBoxShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    offset: Offset(0, 2),
    blurRadius: 2,
    spreadRadius: 0,
  ),
];

final commoCardBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16.0),
    boxShadow: commonCardBoxShadow);