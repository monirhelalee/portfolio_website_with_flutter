import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/features/home/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import 'core/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: "Monir - Portfolio",
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blueGrey,
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueGrey,
            background: Colors.blueGrey.shade800,
            brightness: Brightness.dark,
          ),
        ),

        //const Breakpoint(start: 801, end: 1920, name: DESKTOP),
      ),
    );
  }
}
