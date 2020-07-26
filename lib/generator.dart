import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Generator extends StatefulWidget {
  static String id='generator';
  @override
  _GeneratorState createState() => _GeneratorState();
}

class _GeneratorState extends State<Generator> {

  final msgTextController = TextEditingController();
  String _data="hello";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GENERATOR"),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: msgTextController,
              decoration: InputDecoration(
                hintText: 'Type a string here',
              ),
            ),
            Expanded(
              child: Center(
                child: QrImage(
                  data:_data,
                  size: 320,
                  gapless: false,
                ),
              ),
            ),
            FlatButton(
              child: Text("submit"),
              onPressed: (){
                setState(() {
                  _data=msgTextController.text;
                });
              },
            ),
            FlatButton(
              child: Text("return"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),);
  }
}
