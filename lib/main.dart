import 'package:final_exam_640710543/answer1.dart';
import 'package:final_exam_640710543/answer2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Answer2());
  }
}
