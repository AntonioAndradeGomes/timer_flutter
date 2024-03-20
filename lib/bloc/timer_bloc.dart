import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:timer_flutter/models/ticker.dart';
part 'timer_state.dart';
part 'timer_event.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  static const int _duration = 60;
  StreamSubscription<int>? _tickerSubscription;

  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(
          const TimerInitial(
            duration: _duration,
          ),
        ) {
    on<TimerStarted>(_onStarted);
    on<TimerTicked>(_onTicked);
    on<TimerPaused>(_onPaused);
    on<TimerResumed>(_onResumed);
    on<TimerReset>(_onReset);
  }

  void _onStarted(
    TimerStarted event,
    Emitter<TimerState> emit,
  ) {
    _tickerSubscription?.cancel();
    emit(
      TimerRunInProgress(
        duration: event.duration,
      ),
    );
    _tickerSubscription = _ticker
        .tick(
          ticks: event.duration,
        )
        .listen(
          (duration) => add(
            TimerTicked(
              duration: duration,
            ),
          ),
        );
  }

  FutureOr<void> _onTicked(
    TimerTicked event,
    Emitter<TimerState> emit,
  ) {
    if (event.duration > 0) {
      emit(
        TimerRunInProgress(
          duration: event.duration,
        ),
      );
    } else {
      emit(
        const TimerRunComplete(),
      );
    }
  }

  FutureOr<void> _onResumed(
    TimerResumed event,
    Emitter<TimerState> emit,
  ) {
    _tickerSubscription?.resume();
    emit(
      TimerRunInProgress(
        duration: state.duration,
      ),
    );
  }

  FutureOr<void> _onPaused(
    TimerPaused event,
    Emitter<TimerState> emit,
  ) {
    _tickerSubscription?.pause();
    emit(
      TimerRunPause(
        duration: state.duration,
      ),
    );
  }

  FutureOr<void> _onReset(
    TimerReset event,
    Emitter<TimerState> emit,
  ) {
    _tickerSubscription?.cancel();
    emit(
      const TimerInitial(
        duration: _duration,
      ),
    );
  }

  @override
  Future<void> close() async {
    _tickerSubscription?.cancel();
    super.close();
  }
}
