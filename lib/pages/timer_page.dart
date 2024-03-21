import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:timer_flutter/widgets/actions_buttons_widget.dart';
import 'package:timer_flutter/widgets/timer_text_circular_widget.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Timer',
        ),
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimerTextCircularWidget(),
              Gap(20),
              ActionsButtonsWidget(),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
