import 'package:flutter/material.dart';
import 'package:seektest/app/enums/filter_enum.dart';

abstract class TaskInteractor {
  Future<void> loadMoreTasks(
    BuildContext context,
  );
  void addTask(BuildContext context, String taskName);
  void completeTask(BuildContext context, int taskId);
  void deleteTask(BuildContext context, int taskId);
  Future<int> getTotalTasks(
    BuildContext context,
  );
  Future<int> getCompletedTasks(
    BuildContext context,
  );
  void changeFilter(BuildContext context, FilterEnum filter);
  bool isLastPage(BuildContext context);
}
