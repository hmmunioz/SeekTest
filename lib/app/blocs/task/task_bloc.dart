import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seektest/app/blocs/task/task_event.dart';
import 'package:seektest/app/blocs/task/task_state.dart';
import 'package:seektest/app/repository/task_repository.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;
  int nextPage = 0;
  bool isLastPage = false;

  TaskBloc(this.taskRepository) : super(TaskState.initial()) {
    on<LoadTasksEvent>(_onLoadTasks);
    on<AddTaskEvent>(_onAddTask);
    on<UpdateTaskEvent>(_onUpdateTask);
    on<DeleteTaskEvent>(_onDeleteTask);
    on<CompleteTaskEvent>(_onCompleteTask);
    on<ChangeFilterEvent>(_onChangeFilter);
  }

  Future<void> _onLoadTasks(LoadTasksEvent event, Emitter<TaskState> emit) async {
    emit(state.copyWith(state: TaskStateEnum.loading));

    try {
      final tasks = await taskRepository.getTasks(page: event.page, limit: event.limit, filter: state.currentFilter);
      isLastPage = tasks.isEmpty;

      emit(state.copyWith(
        tasks: event.page == 1 ? tasks : [...state.tasks, ...tasks],
        state: TaskStateEnum.loaded,
      ));
      if (event.page == nextPage) nextPage++;
    } catch (e) {
      emit(state.copyWith(
        state: TaskStateEnum.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onAddTask(AddTaskEvent event, Emitter<TaskState> emit) async {
    emit(state.copyWith(state: TaskStateEnum.updating));

    try {
      await taskRepository.insertTask(event.task);
      nextPage = 1;
      isLastPage = false;
      final tasks = await taskRepository.getTasks(page: nextPage, limit: 20);
      isLastPage = tasks.isEmpty;
      emit(state.copyWith(
        tasks: tasks,
        state: TaskStateEnum.loaded,
      ));
      nextPage++;
    } catch (e) {
      emit(state.copyWith(
        state: TaskStateEnum.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onUpdateTask(UpdateTaskEvent event, Emitter<TaskState> emit) async {
    emit(state.copyWith(state: TaskStateEnum.updating));

    try {
      await taskRepository.updateTask(event.task);

      final updatedTasks = state.tasks.map((task) {
        if (task.id == event.task.id) {
          return event.task;
        }
        return task;
      }).toList();

      emit(state.copyWith(
        tasks: updatedTasks,
        state: TaskStateEnum.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
        state: TaskStateEnum.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onChangeFilter(ChangeFilterEvent event, Emitter<TaskState> emit) async {
    emit(state.copyWith(
      currentFilter: event.filter,
      tasks: [],
    ));

    /*  add(LoadTasksEvent(
      page: 0,
      limit: 20,
    )); */
  }

  Future<void> _onDeleteTask(DeleteTaskEvent event, Emitter<TaskState> emit) async {
    emit(state.copyWith(state: TaskStateEnum.updating));

    try {
      await taskRepository.deleteTask(event.taskId);
      final remainingTasks = state.tasks.where((task) => task.id != event.taskId).toList();

      emit(state.copyWith(
        tasks: remainingTasks,
        state: TaskStateEnum.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
        state: TaskStateEnum.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onCompleteTask(CompleteTaskEvent event, Emitter<TaskState> emit) async {
    emit(state.copyWith(state: TaskStateEnum.updating));

    try {
      await taskRepository.completeTask(event.taskId);

      nextPage = 1;
      isLastPage = false;
      add(LoadTasksEvent(page: nextPage, limit: 20));
    } catch (e) {
      emit(state.copyWith(
        state: TaskStateEnum.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> fetchTaskStatistics() async {
    try {
      final total = await taskRepository.getTotalTaskCount();
      final completed = await taskRepository.getCompletedTaskCount();
      final pending = await taskRepository.getPendingTaskCount();

      emit(state.copyWith(
        totalTasks: total,
        completedTasks: completed,
        pendingTasks: pending,
      ));
    } catch (e) {
      emit(state.copyWith(
        state: TaskStateEnum.error,
        errorMessage: e.toString(),
      ));
    }
  }

  int getTotalTasks() {
    return state.tasks.length;
  }

  int getCompletedTasks() {
    return state.tasks.where((task) => task.isComplete).length;
  }

  int getPendingTasks() {
    return state.tasks.where((task) => !task.isComplete).length;
  }
}
