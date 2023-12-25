import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/features/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Monir's Portfolio",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey.shade900,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          background: Colors.blueGrey.shade800,
          brightness: Brightness.dark,
        ),
      ),
      home: const HomeView(),
      //const Breakpoint(start: 801, end: 1920, name: DESKTOP),
    );
  }
}
