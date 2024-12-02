import 'package:flutter/material.dart';
import 'package:seektest/app/common_widgets/list_view_infinite.dart';
import 'package:seektest/app/entity_models/task/task_entity.dart';

class TaskList extends StatelessWidget {
  final List<TaskEntity> tasks;
  final bool isLastPage;
  final VoidCallback onLoadingMore;
  final Widget Function(TaskEntity task) taskBuilder;

  const TaskList({
    required this.tasks,
    required this.isLastPage,
    required this.onLoadingMore,
    required this.taskBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final estimatedHeight = tasks.length * 100.0;
        final isContentShort = estimatedHeight < constraints.maxHeight;

        return ListViewInfinite(
          onLoadingMore: isContentShort ? null : onLoadingMore,
          isLastPage: isContentShort || isLastPage,
          children: tasks.map(taskBuilder).toList(),
        );
      },
    );
  }
}
