import 'package:flutter/material.dart';
import 'scanner.dart';
import 'home.dart';

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
          },
      theme: ThemeData.dark(),
    );
  }
}
