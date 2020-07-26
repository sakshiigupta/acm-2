import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';

class Scanner extends StatefulWidget {
  static String id='scanner';
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String qrscan="";

  Future startScan() async{
    try{
      var res=await BarcodeScanner.scan();
      setState(() {
        qrscan=res.rawContent;
      });
    }
    on PlatformException catch(e)
    {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SCANNER"),
        ),
        body: Column(
          children: <Widget>[
            Text("ghjsdhg"),
            FlatButton(
              child:Text('start scanning'),
              onPressed: startScan,
            ),
            FlatButton(
              child: Text("Return"),
              onPressed: (){
                Navigator.pop(context);
              },
            )

          ],
        )
    );
  }
}


