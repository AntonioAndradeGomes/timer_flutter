import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_flutter/bloc/timer_bloc.dart';
import 'package:timer_flutter/helpers/helpers.dart';

class TimerTextCircularWidget extends StatelessWidget {
  const TimerTextCircularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        if (state is TimerInitial) {
          return CupertinoTimerPicker(
            initialTimerDuration: Duration(
              seconds: state.durationFinal,
            ),
            onTimerDurationChanged: (dur) {
              context.read<TimerBloc>().add(
                    TimerEdit(
                      duration: dur.inSeconds,
                    ),
                  );
            },
          );
        }
        return SizedBox(
          height: 200,
          width: 200,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  Theme.of(context).colorScheme.primary,
                ),
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey.shade900
                    : Colors.grey.shade200,
                strokeWidth: 5,
                value: state.currentDuration / state.durationFinal,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: AutoSizeText(
                    Helpers.convertSecondsForString(
                      state.currentDuration,
                    ),
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    presetFontSizes: const [36, 26, 16, 12, 10],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
