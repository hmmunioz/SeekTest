part of 'init_bloc.dart';

abstract class InitEvent extends Equatable {
  const InitEvent();

  @override
  List<Object?> get props => [];
}

class ChangeStateEvent extends InitEvent {
  final InitStateEnum state;
  const ChangeStateEvent(this.state);
}
