import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class Scanner extends StatefulWidget {
  static String id='scanner';
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String scanned = '';
  final msgTextController = TextEditingController();
  String _data="hello";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF50DAC9),
          title: Center(
            child: Text('Smart Share'),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text('Scan QR'),
          icon: Icon(Icons.search),
          onPressed: () {
            _scan();
          },
          backgroundColor: Color(0xFF50DAC9),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                              controller: msgTextController,
                              decoration: InputDecoration(
                                hintText: 'Type you\'re password',
                              ),
                            ),
                    ),
                  ),
                  FlatButton(onPressed: (){
                    setState(() {
                      _data=msgTextController.text;
                    });
                  },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFF50DAC9),
                          borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 5,
                                spreadRadius: 4,
                                offset: Offset(0, 3),
                              ),
                            ]
                        ),
                        child: Center(
                          child: Icon(Icons.send, color: Colors.white,),
                        ),
                      ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left:20.0, right: 20, bottom: 20, top: 50),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
//          border: Border.all(color: Colors.black),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 7,
                          spreadRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ]),
                  child: Center(
                        child: QrImage(
                          data:_data,
                          size: 320,
                          gapless: false,
                        ),
                      ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              SelectableText("$scanned")
            ],
          ),
        ),
      ),
    );
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    setState(() {
      scanned = barcode;
    });
    return barcode;
  }
}


