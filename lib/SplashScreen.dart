import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:clean_air/MyHomePage.dart';
import 'package:clean_air/PermissionScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/weather.dart';

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
    } else {
      SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
        executeOnceAfterBuild();
      });
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

  void executeOnceAfterBuild() async {
    WeatherFactory wf = WeatherFactory("3a68f67fd0d2a30c73a4b81306a7657e",
        language: Language.POLISH);
    Weather w = await wf.currentWeatherByCityName("Wałbrzych");
    log(w.toJson().toString());

    var lat = 50.729022;
    var lng = 16.272669;
    String _endpoint = 'http://api.waqi.info/feed';
    var keyword = 'geo:$lat;$lng';
    var key = "3f6502b117e6d1b1d780120c32cfd5c1b75f466b";
    String url = "$_endpoint/$keyword/?token=$key";

    http.Response response = await http.get(Uri.parse(url));
    log(response.body.toString());

    Map<String, dynamic> jsonBody = json.decode(response.body);
    AirQuality aq = AirQuality(jsonBody);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(weather: w, air: aq)));
  }
}

class AirQuality {
  bool isGood = false;
  bool isBad = false;
  String quality = "";
  String advice = "";
  int? aqi = 0;
  int? pm25 = 0;
  int? pm10 = 0;
  String station = "";

  AirQuality(Map<String, dynamic> jsonBody) {
    aqi = int.tryParse(jsonBody['data']['aqi'].toString());
    pm25 = int.tryParse(jsonBody["data"]['iaqi']["pm25"].toString());
    pm10 = int.tryParse(jsonBody['data']['iaqi']["pm10"].toString());
    station = jsonBody['data']['city']['name'].toString();
    setupLevel(aqi!);
  }
  void setupLevel(int aqi) {
    if (aqi <= 100) {
      quality = "Bardzo dobra";
      advice = "Skorzystaj z dobrego powietrza i wyjdź na spacer";
      isGood = true;
    } else if (aqi <= 150) {
      quality = "Bardzo zła!";
      advice = "Jeśli tylko moesz zostań w domu";
      isBad = true;
    } else {
      quality = "Niedobra";
      advice = "Zdecydowanie zostań w domu!";
    }
  }
}

bool havePermission() {
  return false;
}
