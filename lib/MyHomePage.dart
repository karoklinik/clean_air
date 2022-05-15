import 'package:clean_air/AirScreen.dart';
import 'package:clean_air/WeatherScreen.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title, required this.weather})
      : super(key: key);

  final String? title;
  final Weather weather;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentIndex = 1;
  var screens;

  @override
  void initState() {
    screens = [AirScreen(), WeatherScreen(weather: widget.weather)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black45,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 38,
          currentIndex: _currentIndex,
          onTap: (index) => setState((() => _currentIndex = index)),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.masks_outlined), label: 'powietrze'),
            BottomNavigationBarItem(
                icon: Icon(Icons.wb_cloudy_outlined), label: 'pogoda'),
          ]),
    );
  }
}
