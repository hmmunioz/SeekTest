import 'package:seektest/app/data_source/task/task_data_source.dart';
import 'package:seektest/app/entity_models/task/task_entity.dart';
import 'package:seektest/app/enums/filter_enum.dart';

class TaskRepository {
  final TaskDataSource dataSource;

  TaskRepository(this.dataSource);

  Future<List<TaskEntity>> getTasks({required int page, int limit = 20, FilterEnum filter = FilterEnum.all}) async {
    return dataSource.getPaginatedTasks(page: page, limit: limit, filter: filter);
  }

  Future<void> insertTask(TaskEntity task) async {
    await dataSource.insertTask(task);
  }

  Future<void> updateTask(TaskEntity task) async {
    await dataSource.updateTask(task);
  }

  Future<void> deleteTask(int taskId) async {
    await dataSource.deleteTask(taskId);
  }

  Future<void> completeTask(int taskId) async {
    await dataSource.completeTask(taskId);
  }

  Future<void> clearTasks() async {
    await dataSource.clearTasks();
  }

  Future<TaskEntity?> getTaskById(int taskId) async {
    return dataSource.getTaskById(taskId);
  }

  Future<int> getTotalTaskCount() async {
    return await dataSource.getTaskCount();
  }

  Future<int> getCompletedTaskCount() async {
    return await dataSource.getTaskCount(filterByCompleted: true);
  }

  Future<int> getPendingTaskCount() async {
    return await dataSource.getTaskCount(filterByCompleted: false);
  }
}
