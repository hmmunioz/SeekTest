import 'package:bloc/bloc.dart';

class NavigationState {
  final int currentIndex;
  final int previousIndex;

  const NavigationState({
    this.currentIndex = 0,
    this.previousIndex = 0,
  });

  NavigationState copywith({
    int? currentIndex,
    int? previousIndex,
  }) =>
      NavigationState(
        currentIndex: currentIndex ?? this.currentIndex,
        previousIndex: previousIndex ?? this.previousIndex,
      );
}

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit(super.initialState);

  void changeIndex(
    int newIndex,
  ) {
    emit(state.copywith(
      currentIndex: newIndex,
      previousIndex: state.currentIndex,
    ));
  }
}
