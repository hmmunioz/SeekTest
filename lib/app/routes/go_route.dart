import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:seektest/app/ui/task/pages/task_page.dart';
import 'package:seektest/app/ui/container/container_app_page.dart';
import 'package:seektest/app/blocs/init/init_bloc.dart';
import 'package:seektest/app/ui/init/pages/init_page.dart';
import 'package:seektest/app/constants/colors.dart';
import 'package:seektest/app/routes/go_router_refresh_stream.dart';
import 'package:get_it/get_it.dart';

class MyAppRouter {
  final BuildContext context;

  MyAppRouter(this.context);

  GoRouter createdRouter() {
    return GoRouter(
        routes: [
          GoRoute(
            path: '/',
            name: 'init_page',
            builder: (context, state) => const InitPage(),
          ),
          ShellRoute(
              builder: (context, state, child) {
                return ContainerPageApp(
                  children: child,
                );
              },
              routes: [
                GoRoute(
                  path: '/task',
                  name: 'task_page',
                  builder: (context, state) => const TaskPage(),
                ),
              ]),
        ],
        redirect: (BuildContext context, GoRouterState state) {
          final initStatus = context.read<InitBloc>().state.state;

          if (initStatus == InitStateEnum.authorized) {
            return state.fullPath == "/" || state.fullPath == null ? '/task' : state.fullPath;
          } else {
            return '/';
          }
        },
        debugLogDiagnostics: false,
        refreshListenable: GoRouterRefreshStream(context.read<InitBloc>().stream));
  }
}

class UnknowPage extends StatelessWidget {
  const UnknowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
      ),
    );
  }
}

class CheckingPage extends StatelessWidget {
  const CheckingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: ColorsTheme.jediBrown,
        ),
      ),
    );
  }
}
