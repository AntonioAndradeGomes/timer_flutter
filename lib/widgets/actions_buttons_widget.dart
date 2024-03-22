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
        if (state is TimerInitial) {
          final disabled = state.durationFinal == 0;
          return FloatingActionButton(
            tooltip: "Iniciar Timer",
            onPressed: !disabled
                ? () {
                    context.read<TimerBloc>().add(
                          TimerStarted(
                            duration: state.currentDuration,
                          ),
                        );
                  }
                : null,
            backgroundColor: disabled
                ? Theme.of(context).colorScheme.primaryContainer.withAlpha(50)
                : Theme.of(context).colorScheme.primaryContainer,
            child: const Icon(
              Icons.play_arrow_rounded,
            ),
          );
        }
        if (state is TimerRunInProgress) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                tooltip: "Pausar Timer",
                onPressed: () {
                  context.read<TimerBloc>().add(
                        TimerPaused(),
                      );
                },
                child: const Icon(
                  Icons.pause_rounded,
                ),
              ),
              const Gap(20),
              FloatingActionButton(
                tooltip: "Cancelar Timer",
                onPressed: () {
                  context.read<TimerBloc>().add(
                        TimerReset(),
                      );
                },
                child: const Icon(
                  Icons.stop_rounded,
                ),
              ),
            ],
          );
        }
        if (state is TimerRunPause) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                tooltip: "Continuar Timer",
                onPressed: () {
                  context.read<TimerBloc>().add(
                        TimerResumed(),
                      );
                },
                child: const Icon(
                  Icons.play_arrow_rounded,
                ),
              ),
              const Gap(20),
              FloatingActionButton(
                tooltip: "Reiniciar Timer",
                onPressed: () {
                  context.read<TimerBloc>().add(
                        TimerRestart(),
                      );
                },
                child: const Icon(
                  Icons.restart_alt_rounded,
                ),
              ),
              const Gap(20),
              FloatingActionButton(
                tooltip: "Cancelar Timer",
                onPressed: () {
                  context.read<TimerBloc>().add(
                        TimerReset(),
                      );
                },
                child: const Icon(
                  Icons.stop_rounded,
                ),
              ),
            ],
          );
        }
        if (state is TimerRunComplete) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                tooltip: "Reiniciar Timer",
                onPressed: () {
                  context.read<TimerBloc>().add(
                        TimerRestart(),
                      );
                },
                child: const Icon(
                  Icons.restart_alt_rounded,
                ),
              ),
              const Gap(20),
              FloatingActionButton(
                tooltip: "Cancelar Timer",
                onPressed: () {
                  context.read<TimerBloc>().add(
                        TimerReset(),
                      );
                },
                child: const Icon(
                  Icons.stop_rounded,
                ),
              ),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
