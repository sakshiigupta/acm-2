import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'scanner.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class Home extends StatefulWidget {
  static String id='home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  
  String _authorize = "Not authorized";
  LocalAuthentication authentication = LocalAuthentication();
  Future<void> _authorizeNow() async {
    bool authorize = false;
    try {
      authorize = await authentication.authenticateWithBiometrics(
        localizedReason: "Scan your fingerprint",
        useErrorDialogs: true,
        stickyAuth: false,
      );
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _authorize = authorize ? "Authorized" : "Not authorized";
      if (authorize){
        Navigator.pushNamed(context, Scanner.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AnimatedBackground(
          behaviour: RandomParticleBehaviour(),
          vsync: this,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:200.0),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top:100.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TypewriterAnimatedTextKit(
                                text: ['Share Safe'],
                                textStyle: TextStyle(
                                  fontSize: 45.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top:100.0),
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 2.0, color: const Color(0xFF39ff14)),
                                  borderRadius: BorderRadius.all(Radius.circular(100))
                              ),
                              child: FlatButton(
                                  onPressed: _authorizeNow,
                                  child: Image(
                                    image: AssetImage('images/finger.jpg'), width: 100, height: 100,
                                  )),
                            ),
                          ),
                        ],
                      ),
                  ),
                ),
              ),
              Center(child: Text("Made by Sakshi X Siddharth"))
            ],
          ),
        ),
      ),
    );
  }
}
