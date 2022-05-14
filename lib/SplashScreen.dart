import 'package:clean_air/PermissionScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    if (havePermission()) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const PermissionScreen(
                  title: Strings.appTitle,
                )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage("assets/cloud-sun.png"),
                ),
                const Padding(padding: EdgeInsets.only(top: 15.0)),
                Text(Strings.appTitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 42.0,
                      color: Colors.white,
                    ))),
                const Padding(padding: EdgeInsets.only(top: 5.0)),
                Text('Aplikacja do monitorowania \n czystości powietrza',
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
                child: Text('Przywiewam dane...',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18.0,
                      color: Colors.white,
                    ))),
              ))
        ],
      ),
    );
  }
}

bool havePermission() {
  return true;
}
