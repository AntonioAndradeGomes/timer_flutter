import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:timer_flutter/bloc/timer_bloc.dart';
import 'package:timer_flutter/widgets/actions_buttons_widget.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cronomêtro',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${context.select((TimerBloc bloc) => bloc.state.duration)}",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Gap(20),
            ActionsButtonsWidget(),
          ],
        ),
      ),
    );
  }
}
