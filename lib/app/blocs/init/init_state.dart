part of 'init_bloc.dart';

enum InitStateEnum {
  initial,
  loading,
  loaded,
  login,
  success,
  error,
  checking,
  welcome,
  authorized,
  logout
}

class InitState extends Equatable {
  const InitState({
    this.state = InitStateEnum.initial,
    this.errorMessage,
    this.locale,
    this.error,
  });

  final String? errorMessage;
  final bool? error;
  final InitStateEnum state;
  final Locale? locale;
  InitState copyWith({
    InitStateEnum? state,
    bool? error,
    Locale? locale,
    String? errorMessage,
  }) {
    return InitState(
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
      locale: locale ?? this.locale,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        state,
        errorMessage,
        locale,
        error,
      ];
}
