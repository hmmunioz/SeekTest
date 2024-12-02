import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:go_router/go_router.dart';
import 'package:seektest/app/blocs/task/task_state.dart';
import 'package:seektest/app/common_widgets/show_custom_modal.dart';
import 'package:seektest/app/enums/filter_enum.dart';
import 'package:seektest/app/ui/task/widgets/add_button.dart';
import 'package:seektest/app/ui/task/widgets/add_dialog.dart';
import 'package:seektest/app/ui/task/widgets/confirm_dialog.dart';
import 'package:seektest/app/ui/task/widgets/filter_list.dart';
import 'package:seektest/app/ui/task/widgets/task_card.dart';
import 'package:seektest/app/ui/task/widgets/task_list.dart';
import 'package:seektest/app/ui/task/widgets/user_header.dart';

import 'task_interactor.dart';

class TaskUI extends StatefulWidget {
  final TaskInteractor taskInteractor;
  final TaskState state;

  const TaskUI(this.taskInteractor, this.state, {super.key});

  @override
  _TaskUIState createState() => _TaskUIState();
}

class _TaskUIState extends State<TaskUI> {
  int totalTasks = 0;
  int completedTasks = 0;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    if (mounted) {
      widget.taskInteractor.changeFilter(context, FilterEnum.all);
      _loadTaskStatistics();
    }
  }

  Future<void> _loadTaskStatistics() async {
    final total = await widget.taskInteractor.getTotalTasks(context);
    final completed = await widget.taskInteractor.getCompletedTasks(context);

    if (mounted) {
      setState(() {
        totalTasks = total;
        completedTasks = completed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFF5F5DC),
                  Color(0xFFE0D7B5),
                  Color(0xFFF5F5DC),
                  Color(0xFFE0D7B5),
                ],
              ),
            ),
          ),
          Column(
            children: [
              UserHeader(
                totalTasks: totalTasks,
                completedTasks: completedTasks,
              ),
              AddButton(
                onSelected: () => showCustomModal(
                  context,
                  child: AddDialog(
                    onTaskAdded: (String taskName) async {
                      widget.taskInteractor.addTask(context, taskName);
                      context.pop();
                      await _loadTaskStatistics();
                    },
                  ),
                ),
              ),
              FilterList(
                taskInteractor: widget.taskInteractor,
                taskState: widget.state,
              ),
              Expanded(
                child: TaskList(
                  tasks: widget.state.tasks,
                  isLastPage: widget.taskInteractor.isLastPage(context),
                  onLoadingMore: () async {
                    await widget.taskInteractor.loadMoreTasks(context);
                    await _loadTaskStatistics();
                  },
                  taskBuilder: (task) => TaskCard(
                    title: task.title,
                    subtitle: task.date.toString(),
                    isComplete: task.isComplete,
                    onDelete: () {
                      showCustomModal(
                        context,
                        child: ConfirmDialog(
                          title: translate('are_you_sure'),
                          onConfirm: () async {
                            widget.taskInteractor.deleteTask(context, task.id!);
                            await _loadTaskStatistics();
                          },
                        ),
                      );
                    },
                    onComplete: () async {
                      widget.taskInteractor.completeTask(context, task.id!);
                      await _loadTaskStatistics();
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
