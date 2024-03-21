part of 'timer_bloc.dart';

sealed class TimerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TimerEdit extends TimerEvent {
  final int duration;

  TimerEdit({
    required this.duration,
  });

  @override
  List<Object?> get props => [
        duration,
      ];
}

class TimerStarted extends TimerEvent {
  final int duration;

  TimerStarted({
    required this.duration,
  });

  @override
  List<Object?> get props => [
        duration,
      ];
}

class TimerPaused extends TimerEvent {}

class TimerResumed extends TimerEvent {}

class TimerReset extends TimerEvent {}

class TimerTicked extends TimerEvent {
  final int duration;

  TimerTicked({
    required this.duration,
  });

  @override
  List<Object?> get props => [
        duration,
      ];
}
