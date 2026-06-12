import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/theme/app_theme.dart';
import 'package:my_portfolio_flutter/features/home/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import 'core/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        title: 'Monir Haider — Portfolio',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: AppTheme.dark,
      ),
    );
  }
}
