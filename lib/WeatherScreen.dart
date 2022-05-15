import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class WeatherScreen extends StatefulWidget {
  final Weather? weather;

  const WeatherScreen({Key? key, this.weather}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: const Color(0xffffffff),
                gradient: getGradientByMood(widget.weather)),
          ),
          Align(
            alignment: FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 45.0)),
                Image(
                  image: AssetImage(
                      "assets/${getIconByMood(widget.weather!)}.png"),
                ),
                const Padding(padding: EdgeInsets.only(top: 41.0)),
                Text(
                    "${DateFormat.MMMMEEEEd("pl").format(DateTime.now())}, ${widget.weather?.weatherDescription}",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      fontSize: 14.0,
                      height: 1.2,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ))),
                const Padding(padding: EdgeInsets.only(top: 12.0)),
                Text(
                    '${widget.weather?.temperature?.celsius?.floor().toString()}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      fontSize: 64.0,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ))),
                Text(
                    'Odczuwalna ${widget.weather?.tempFeelsLike?.celsius?.floor().toString()}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      fontSize: 14.0,
                      height: 1.2,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ))),
                const Padding(padding: EdgeInsets.only(top: 25.0)),
                IntrinsicHeight(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Ciśnienie',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                    fontSize: 14.0,
                                    height: 1.2,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  ))),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              Text('${widget.weather?.pressure?.floor()} hPa',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                    fontSize: 26.0,
                                    height: 1.2,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  )))
                            ],
                          ),
                        ),
                        const VerticalDivider(
                          color: Colors.white,
                          width: 48,
                          thickness: 1,
                        ),
                        SizedBox(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Wiatr',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                    fontSize: 14.0,
                                    height: 1.2,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  ))),
                              const Padding(padding: EdgeInsets.only(top: 2.0)),
                              Text('${widget.weather?.windSpeed?.floor()} m/s',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                    fontSize: 26.0,
                                    height: 1.2,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  )))
                            ],
                          ),
                        ),
                      ]),
                ),
                const Padding(padding: EdgeInsets.only(top: 24.0)),
                if (widget.weather?.rainLastHour != null)
                  Text('Opady ${widget.weather?.rainLastHour} mm/1h',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                        fontSize: 14.0,
                        height: 1.2,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ))),
                const Padding(padding: EdgeInsets.only(top: 68.0)),
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

  String getIconByMood(Weather weather) {
    var main = weather.weatherMain;
    if (main == "Clouds" || main == "Drizzle" || main == "Snow") {
      return "weather-rain";
    } else if (main == "Thunderstorm") {
      return "weather-lightning";
    } else if (isNight(weather)) {
      return "weather-moonny";
    } else {
      return "weather=sunny";
    }
  }

  bool isNight(Weather weather) {
    var dateSunset = weather.sunset!;
    var dateSunrise = weather.sunrise!;
    return DateTime.now().isAfter(dateSunset) ||
        DateTime.now().isBefore(dateSunrise);
  }

  LinearGradient getGradientByMood(Weather? weather) {
    var main = weather?.weatherMain;
    if (main == "Clouds" || main == "Drizzle" || main == "Snow") {
      return const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [Color(0xff6e6cd8), Color(0xff48a8ef), Color(0xff77e1ee)],
      );
    } else if (main == "Thunderstorm" || isNight(weather!)) {
      return const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Color(0xff313545), Color(0xff121118)],
      );
    } else {
      return const LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [Color(0xff5283F0), Color(0xffcdedd4)],
      );
    }
  }
}
