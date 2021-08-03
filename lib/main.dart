import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/model/tombol.dart';
import 'package:flutter_calculator_app/myhomepage.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:  MainBody(),
    );
  }
}
