import 'package:flutter/material.dart';
import 'package:timer_flutter/config/theme/app_theme.dart';
import 'package:timer_flutter/pages/timer_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer Flutter',
      theme: AppTheme.ligth,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const TimerPage(),
    );
  }
}
