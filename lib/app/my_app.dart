import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_flutter/bloc/timer_bloc.dart';
import 'package:timer_flutter/config/theme/app_theme.dart';
import 'package:timer_flutter/models/ticker.dart';
import 'package:timer_flutter/pages/timer_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer Flutter',
      theme: AppTheme.ligth,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: BlocProvider<TimerBloc>(
        create: (context) => TimerBloc(
          ticker: Ticker(),
        ),
        child: const TimerPage(),
      ),
    );
  }
}
