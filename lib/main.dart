import 'package:flutter/material.dart';
import 'package:flutter_train_app/config/theme.dart';
import 'package:flutter_train_app/pages/home/home_page.dart';
import 'package:flutter_train_app/pages/seat/seat_page.dart';
import 'package:flutter_train_app/pages/station_list/station_list_page.dart';

void main() {
  runApp(const TrainApp());
}

class TrainApp extends StatelessWidget {
  const TrainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Train Booking',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/stationList': (context) => const StationListPage(),
        '/seat': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments as Map<String, String>;
          return SeatPage(
            departure: args['departure']!,
            arrival: args['arrival']!,
          );
        },
      },
    );
  }
}
