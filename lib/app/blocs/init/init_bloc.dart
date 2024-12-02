import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart' as bloc;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

part 'inti_event.dart';
part 'init_state.dart';

class InitBloc extends bloc.Bloc<InitEvent, InitState> {
  final _logger = Logger();
  InitBloc() : super(const InitState()) {
    on<ChangeStateEvent>(_onChangeStateEvent);
  }

  FutureOr<void> _onChangeStateEvent(
      ChangeStateEvent event, Emitter<InitState> emit) {
    _logger.d("ChangeStateEvent");

    emit(state.copyWith(state: event.state));
  }
}
