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
            currentDuration: _duration,
            durationFinal: _duration,
          ),
        ) {
    on<TimerEdit>(_onEdit);
    on<TimerStarted>(_onStarted);
    on<TimerTicked>(_onTicked);
    on<TimerResumed>(_onResumed);
    on<TimerPaused>(_onPaused);
    on<TimerReset>(_onReset);
  }

  void _onEdit(
    TimerEdit event,
    Emitter<TimerState> emit,
  ) {
    _tickerSubscription?.cancel();
    emit(
      TimerInitial(
        durationFinal: event.duration,
        currentDuration: event.duration,
      ),
    );
  }

  void _onStarted(
    TimerStarted event,
    Emitter<TimerState> emit,
  ) {
    _tickerSubscription?.cancel();
    emit(
      TimerRunInProgress(
        durationFinal: event.duration,
        currentDuration: event.duration,
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

  void _onTicked(
    TimerTicked event,
    Emitter<TimerState> emit,
  ) {
    if (event.duration > 0) {
      emit(
        TimerRunInProgress(
          currentDuration: event.duration,
          durationFinal: state.durationFinal,
        ),
      );
    } else {
      emit(
        TimerRunComplete(
          durationFinal: state.durationFinal,
        ),
      );
    }
  }

  void _onResumed(
    TimerResumed event,
    Emitter<TimerState> emit,
  ) {
    _tickerSubscription?.resume();
    emit(
      TimerRunInProgress(
        currentDuration: state.currentDuration,
        durationFinal: state.durationFinal,
      ),
    );
  }

  void _onPaused(
    TimerPaused event,
    Emitter<TimerState> emit,
  ) {
    _tickerSubscription?.pause();
    emit(
      TimerRunPause(
        currentDuration: state.currentDuration,
        durationFinal: state.durationFinal,
      ),
    );
  }

  void _onReset(
    TimerReset event,
    Emitter<TimerState> emit,
  ) {
    _tickerSubscription?.cancel();
    emit(
      TimerInitial(
        durationFinal: state.durationFinal,
        currentDuration: state.durationFinal,
      ),
    );
  }

  @override
  Future<void> close() async {
    _tickerSubscription?.cancel();
    super.close();
  }
}
