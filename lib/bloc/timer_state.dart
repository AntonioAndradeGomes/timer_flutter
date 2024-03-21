part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {
  final int currentDuration;
  final int durationFinal;

  const TimerState({
    required this.currentDuration,
    required this.durationFinal,
  });

  @override
  List<Object?> get props => [currentDuration, durationFinal];
}

class TimerInitial extends TimerState {
  const TimerInitial({
    required super.currentDuration,
    required super.durationFinal,
  });

  @override
  String toString() =>
      'TimerInitial {durationCurrent $currentDuration, durationFinal: $durationFinal}';
}

class TimerRunPause extends TimerState {
  const TimerRunPause({
    required super.currentDuration,
    required super.durationFinal,
  });

  @override
  String toString() =>
      'TimerRunPause {durationCurrent $currentDuration, durationFinal: $durationFinal}';
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress({
    required super.currentDuration,
    required super.durationFinal,
  });

  @override
  String toString() =>
      'TimerRunInProgress {durationCurrent $currentDuration, durationFinal: $durationFinal}';
}

class TimerRunComplete extends TimerState {
  const TimerRunComplete({
    required super.durationFinal,
  }) : super(
          currentDuration: 0,
        );

  @override
  String toString() =>
      'TimerRunComplete {durationCurrent $currentDuration, durationFinal: $durationFinal}';
}
