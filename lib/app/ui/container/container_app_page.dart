import 'package:seektest/app/ui/container/container_app_interactor.dart';
import 'package:seektest/app/ui/container/container_app_ui.dart';
import 'package:seektest/app/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContainerPageApp extends StatelessWidget implements ContainerAppInteractor {
  final Widget children;

  const ContainerPageApp({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return ContainerAppUI(
      interactor: this,
      children: children,
    );
  }

  @override
  void logOut(BuildContext context) {
    final initBloc = BlocProvider.of<InitBloc>(context, listen: false);
    initBloc.add(const ChangeStateEvent(InitStateEnum.initial));
  }
}
