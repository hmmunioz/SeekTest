import 'package:seektest/app/entity_models/task/task_entity.dart';
import 'package:seektest/app/enums/filter_enum.dart';

abstract class TaskEvent {}

class LoadTasksEvent extends TaskEvent {
  final int page;
  final int limit;
  LoadTasksEvent({
    required this.page,
    this.limit = 20,
  });
}

class AddTaskEvent extends TaskEvent {
  final TaskEntity task;

  AddTaskEvent(this.task);
}

class UpdateTaskEvent extends TaskEvent {
  final TaskEntity task;

  UpdateTaskEvent(this.task);
}

class DeleteTaskEvent extends TaskEvent {
  final int taskId;

  DeleteTaskEvent(this.taskId);
}

class CompleteTaskEvent extends TaskEvent {
  final int taskId;

  CompleteTaskEvent(this.taskId);
}

class ChangeFilterEvent extends TaskEvent {
  final FilterEnum filter;

  ChangeFilterEvent(this.filter);
}
