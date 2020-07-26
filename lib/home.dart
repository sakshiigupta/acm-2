import 'package:acm_medium/generator.dart';
import 'package:flutter/material.dart';
import 'package:acm_medium/scanner.dart';


class Home extends StatelessWidget {
  static String id='home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR"),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.all(10.0),
              color: Colors.tealAccent,
              child: Text('SCAN CODE'),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
              onPressed: (){
                Navigator.pushNamed(context, Scanner.id);
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            FlatButton(
              padding: EdgeInsets.all(10.0),
              color: Colors.blueGrey,
              child: Text('GENERATE CODE'),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
              onPressed: (){
                Navigator.pushNamed(context,Generator.id);
              },
            ),
          ],
        ),
      ),
    ) ;
  }
}
