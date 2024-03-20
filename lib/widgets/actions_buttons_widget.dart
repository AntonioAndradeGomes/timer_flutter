import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:timer_flutter/bloc/timer_bloc.dart';

class ActionsButtonsWidget extends StatelessWidget {
  const ActionsButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        log(state.toString());
        if (state is TimerInitial) {
          return FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.play_arrow_rounded,
            ),
          );
        }
        if (state is TimerRunInProgress) {
          return Row(
            children: [
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(
                  Icons.pause_rounded,
                ),
              ),
              const Gap(20),
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(
                  Icons.replay_rounded,
                ),
              ),
            ],
          );
        }
        if (state is TimerRunPause) {
          return Row(
            children: [
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(
                  Icons.play_arrow_rounded,
                ),
              ),
              const Gap(20),
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(
                  Icons.replay_rounded,
                ),
              ),
            ],
          );
        }
        if (state is TimerRunComplete) {
          return FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.replay_rounded,
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
