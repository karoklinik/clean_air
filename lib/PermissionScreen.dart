import 'package:clean_air/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({Key? key, required String title}) : super(key: key);

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                color: Color(0xffffffff),
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [Color(0xff6671e5), Color(0xff4852d9)],
                )),
          ),
          Align(
            alignment: FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Image(
                  image: AssetImage("assets/hand-wave.png"),
                ),
                const Padding(padding: EdgeInsets.only(top: 15.0)),
                Text('Hejka!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                      color: Colors.white,
                    ))),
                const Padding(padding: EdgeInsets.only(top: 5.0)),
                Text(
                    'Aplikacja ${Strings.appTitle} potrzebuje do działania\n przyblionej lokalizacji urządzenia',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    )))
              ],
            ),
          ),
          Positioned(
              left: 0,
              bottom: 35,
              right: 0,
              child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.only(top: 12.0, bottom: 12.0))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MyHomePage(title: Strings.appTitle)));
                      },
                      child: const Text(
                        'Zgoda!',
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}
