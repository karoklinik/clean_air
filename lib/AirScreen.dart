import 'package:clean_air/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AirScreen extends StatefulWidget {
  const AirScreen({Key? key, required this.air}) : super(key: key);
  final AirQuality air;

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
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              gradient: getGradientByMood(widget.air),
            ),
          ),
          Align(
            alignment: FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Jakość powietrza",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                      fontSize: 14.0,
                      height: 1.2,
                      fontWeight: FontWeight.w300,
                      color: getBackgroundTextColor(widget.air),
                    ))),
                const Padding(padding: EdgeInsets.only(top: 2)),
                Text(widget.air.quality,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                      fontSize: 22.0,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      color: getBackgroundTextColor(widget.air),
                    ))),
                const Padding(padding: EdgeInsets.only(top: 24)),
                CircleAvatar(
                  radius: 91.0,
                  backgroundColor: Colors.white,
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Text((widget.air.aqi! / 200 * 100).floor().toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                              fontSize: 64.0,
                              height: 1.2,
                              fontWeight: FontWeight.w300,
                              color: getBackgroundTextColor(widget.air),
                            ))),
                        Text("CAQI info",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                              fontSize: 16.0,
                              height: 1.2,
                              fontWeight: FontWeight.w300,
                              color: getBackgroundTextColor(widget.air),
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
                                      textStyle: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.2,
                                    fontWeight: FontWeight.w300,
                                    color: getBackgroundTextColor(widget.air),
                                  ))),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              Text(widget.air.pm25.toString() + '%',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                    fontSize: 22.0,
                                    height: 1.2,
                                    fontWeight: FontWeight.w700,
                                    color: getBackgroundTextColor(widget.air),
                                  )))
                            ],
                          ),
                        ),
                        VerticalDivider(
                          color: getBackgroundTextColor(widget.air),
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
                                      textStyle: TextStyle(
                                    fontSize: 14.0,
                                    height: 1.2,
                                    fontWeight: FontWeight.w300,
                                    color: getBackgroundTextColor(widget.air),
                                  ))),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              Text(widget.air.pm10.toString() + '%',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                    fontSize: 22.0,
                                    height: 1.2,
                                    fontWeight: FontWeight.w700,
                                    color: getBackgroundTextColor(widget.air),
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
                        textStyle: TextStyle(
                      fontSize: 12.0,
                      height: 1.2,
                      fontWeight: FontWeight.w300,
                      color: getBackgroundTextColor(widget.air),
                    ))),
                const Padding(padding: EdgeInsets.only(top: 8)),
                Text(widget.air.station,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                      fontSize: 14.0,
                      height: 1.2,
                      fontWeight: FontWeight.w400,
                      color: getBackgroundTextColor(widget.air),
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
                          child: getDangerValueBottom(widget.air),
                        ),
                      ),
                      ClipRect(
                        //pierwszy na stosie, na jego wierzchu
                        child: Align(
                          alignment: Alignment.topLeft,
                          heightFactor: 1 - (widget.air.aqi! / 200.floor()),
                          child: getDangerValueTop(widget.air),
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
                              Image(
                                alignment: Alignment.centerLeft,
                                image: getAdviceImage(widget.air),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(left: 8.0)),
                              Text(widget.air.advice,
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

  LinearGradient getGradientByMood(AirQuality air) {
    if (air.isGood) {
      return const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [Color(0xff4acf8f), Color(0xff75eda6)],
      );
    } else if (air.isBad) {
      return const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xfffbda61), Color(0xfff76b1c)],
      );
    } else {
      return const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [Color(0xfff4003a), Color(0xffff8888)],
      );
    }
  }

  Color? getBackgroundTextColor(AirQuality air) {
    if (air.isBad || air.isGood)
      return Colors.black;
    else
      return Colors.white;
  }

  Image getDangerValueBottom(AirQuality air) {
    if (air.isBad || air.isGood) {
      return Image.asset(
        'assets/danger-value-negative.png',
        scale: 0.9,
      );
    } else {
      return Image.asset(
        'assets/danger-value.png',
        scale: 0.9,
      );
    }
  }

  getDangerValueTop(AirQuality air) {
    if (air.isGood) {
      return Image.asset(
        'assets/danger-value-negative.png',
        color: Color(0xff4acf8f),
        scale: 0.9,
      );
    }
    if (air.isBad) {
      return Image.asset(
        'assets/danger-value-negative.png',
        color: Color(0xfffbda61),
        scale: 0.9,
      );
    } else {
      return Image.asset(
        'assets/danger-value.png',
        color: Color(0xfff4003a),
        scale: 0.9,
      );
    }
  }

  AssetImage getAdviceImage(AirQuality air) {
    if (air.isGood) {
      return AssetImage('assets/happy.png');
    } else if (air.isBad) {
      return AssetImage('assets/ok.png');
    } else {
      return AssetImage('assets/sad.png');
    }
  }
}
