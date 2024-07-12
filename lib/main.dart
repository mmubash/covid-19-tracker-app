import 'package:covid_19_tracker/Views/countries_list.dart';
import 'package:covid_19_tracker/Views/show_country_data.dart';
import 'package:covid_19_tracker/Views/splash_screen.dart';
import 'package:covid_19_tracker/Views/world_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          // Add other theme customization as needed
        ),
      home: SplashScreen(),
    );
  }
}



