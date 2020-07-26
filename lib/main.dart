import 'package:acm_medium/generator.dart';
import 'package:flutter/material.dart';
import 'package:acm_medium/scanner.dart';
import 'package:acm_medium/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home.id,
      routes:
          {
            Home.id: (context)=>Home(),
            Scanner.id: (context)=>Scanner(),
            Generator.id: (context)=>Generator(),
          },
      theme: ThemeData.dark(),
    );
  }
}
