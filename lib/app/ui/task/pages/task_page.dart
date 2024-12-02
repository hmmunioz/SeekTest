import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seektest/app/blocs/task/task_bloc.dart';
import 'package:seektest/app/blocs/task/task_event.dart';
import 'package:seektest/app/blocs/task/task_state.dart';
import 'package:seektest/app/entity_models/task/task_entity.dart';
import 'package:seektest/app/enums/filter_enum.dart';

import 'task_interactor.dart';
import 'task_ui.dart';

class TaskPage extends StatelessWidget implements TaskInteractor {
  const TaskPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        if (state.state == TaskStateEnum.loading) {}
      },
      builder: (context, state) {
        return TaskUI(this, state);
      },
    );
  }

  @override
  Future<void> loadMoreTasks(BuildContext context) async {
    final taskBloc = BlocProvider.of<TaskBloc>(context, listen: false);
    if (taskBloc.state.state != TaskStateEnum.loading && !taskBloc.isLastPage) {
      taskBloc.add(LoadTasksEvent(
        page: taskBloc.nextPage,
        limit: 20,
      ));
    }
  }

  @override
  void addTask(BuildContext context, String taskName) {
    final taskBloc = BlocProvider.of<TaskBloc>(context, listen: false);
    taskBloc.add(AddTaskEvent(TaskEntity(
      title: taskName,
      date: DateTime.now(),
      isComplete: false,
    )));
  }

  @override
  void completeTask(BuildContext context, int taskId) {
    final taskBloc = BlocProvider.of<TaskBloc>(context, listen: false);
    taskBloc.add(CompleteTaskEvent(taskId));
  }

  @override
  void deleteTask(BuildContext context, int taskId) {
    final taskBloc = BlocProvider.of<TaskBloc>(context, listen: false);
    taskBloc.add(DeleteTaskEvent(taskId));
  }

  @override
  Future<int> getTotalTasks(BuildContext context) async {
    final taskBloc = BlocProvider.of<TaskBloc>(context, listen: false);
    return await taskBloc.taskRepository.getTotalTaskCount();
  }

  @override
  Future<int> getCompletedTasks(
    BuildContext context,
  ) async {
    final taskBloc = BlocProvider.of<TaskBloc>(context, listen: false);
    return await taskBloc.taskRepository.getCompletedTaskCount();
  }

  @override
  void changeFilter(BuildContext context, FilterEnum filter) {
    try {
      final taskBloc = BlocProvider.of<TaskBloc>(context, listen: false);
      taskBloc.add(ChangeFilterEvent(filter));
      taskBloc.add(LoadTasksEvent(
        page: 0,
        limit: 20,
      ));
    } catch (e) {
      print(e);
    }
  }

  @override
  bool isLastPage(BuildContext context) {
    final taskBloc = BlocProvider.of<TaskBloc>(context, listen: false);
    return taskBloc.state.isLastPage;
  }
}
