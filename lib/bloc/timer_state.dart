part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {
  final int duration;

  const TimerState({
    required this.duration,
  });

  @override
  List<Object?> get props => [
        duration,
      ];
}

class TimerInitial extends TimerState {
  const TimerInitial({
    required super.duration,
  });

  @override
  String toString() => 'TimerInitial {duration $duration}';
}

class TimerRunPause extends TimerState {
  const TimerRunPause({
    required super.duration,
  });

  @override
  String toString() => 'TimerRunPause {duration $duration}';
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress({
    required super.duration,
  });

  @override
  String toString() => 'TimerRunInProgress {duration $duration}';
}

class TimerRunComplete extends TimerState {
  const TimerRunComplete()
      : super(
          duration: 0,
        );

  @override
  String toString() => 'TimerRunComplete {duration $duration}';
}
