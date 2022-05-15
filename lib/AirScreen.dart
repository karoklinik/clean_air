import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AirScreen extends StatefulWidget {
  const AirScreen({Key? key}) : super(key: key);

  @override
  State<AirScreen> createState() => _AirScreenState();
}

class _AirScreenState extends State<AirScreen> {
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
                  colors: [Color(0xff4acf8c), Color(0xff75eda6)],
                )),
          ),
          Align(
            alignment: FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Jakość powietrza",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      fontSize: 14.0,
                      height: 1.2,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ))),
                const Padding(padding: EdgeInsets.only(top: 2)),
                Text("Bardzo dobra",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      fontSize: 22.0,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ))),
                const Padding(padding: EdgeInsets.only(top: 24)),
                CircleAvatar(
                  radius: 91.0,
                  backgroundColor: Colors.white,
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Text("23",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                              fontSize: 64.0,
                              height: 1.2,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ))),
                        Text("CAQI info",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                              fontSize: 16.0,
                              height: 1.2,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            )))
                      ])),
                ),
                const Padding(padding: EdgeInsets.only(top: 24)),
                IntrinsicHeight(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('PM 2,5',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                    fontSize: 14.0,
                                    height: 1.2,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                  ))),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              Text('10%',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                    fontSize: 22.0,
                                    height: 1.2,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  )))
                            ],
                          ),
                        ),
                        const VerticalDivider(
                          color: Colors.black,
                          width: 24,
                          thickness: 1,
                        ),
                        SizedBox(
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('PM 10',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                    fontSize: 14.0,
                                    height: 1.2,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                  ))),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              Text('12%',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                    fontSize: 22.0,
                                    height: 1.2,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  )))
                            ],
                          ),
                        ),
                      ]),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Text("Stacja pomiarowa",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      fontSize: 12.0,
                      height: 1.2,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ))),
                const Padding(padding: EdgeInsets.only(top: 8)),
                Text("Warszawa",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      fontSize: 14.0,
                      height: 1.2,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ))),
                const Padding(
                    padding:
                        EdgeInsets.only(top: 76)) //powinno być osobną stałą
              ],
            ),
          ),
          Positioned(
              left: 8,
              bottom: (76.0) * 2,
              right: 0,
              top: 0,
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Stack(
                    children: [
                      ClipRect(
                        child: Align(
                          alignment: Alignment.topLeft,
                          heightFactor: 1,
                          child: Image.asset(
                            'assets/danger-value-negative.png',
                            scale: 0.9,
                          ),
                        ),
                      ),
                      ClipRect(
                        //pierwszy na stosie, na jego wierzchu
                        child: Align(
                          alignment: Alignment.topLeft,
                          heightFactor: 1 - 0.4,
                          child: Image.asset(
                            'assets/danger-value.png',
                            color: const Color(0xDD4acf87),
                            scale: 0.9,
                          ),
                        ),
                      ),
                    ],
                  ))),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 62, right: 10, bottom: 14, left: 10),
                      child: Divider(
                        height: 10,
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 10, bottom: 24, left: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(10.0),
                          height: 38,
                          child: IntrinsicHeight(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Image(
                                alignment: Alignment.centerLeft,
                                image: AssetImage('assets/happy.png'),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(left: 8.0)),
                              Text(
                                  "Skorzystaj z dobrego powietrza i wyjdź na dwór",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                    fontSize: 12.0,
                                    height: 1.2,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                  ))),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
