import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:seektest/app/blocs/task/task_bloc.dart';
import 'package:seektest/app/blocs/task/task_event.dart';
import 'package:seektest/app/blocs/task/task_state.dart';
import 'package:seektest/app/entity_models/task/task_entity.dart';
import 'package:seektest/app/enums/filter_enum.dart';
import 'package:seektest/app/repository/task_repository.dart';

import 'widget_test.mocks.dart';

@GenerateMocks([TaskRepository])
void main() {
  late TaskBloc taskBloc;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    taskBloc = TaskBloc(mockTaskRepository);
  });

  tearDown(() {
    taskBloc.close();
  });

  group('TaskBloc Tests', () {
    test('initial state is TaskState.initial()', () {
      expect(taskBloc.state, TaskState.initial());
    });

    blocTest<TaskBloc, TaskState>(
      'emits [loading, loaded] when LoadTasksEvent is added',
      build: () {
        when(mockTaskRepository.getTasks(page: 1, limit: 20, filter: FilterEnum.all)).thenAnswer((_) async => [
              TaskEntity(id: 1, title: 'Task 1', date: DateTime(2023, 1, 1), isComplete: false),
            ]);
        return taskBloc;
      },
      act: (bloc) => bloc.add(LoadTasksEvent(page: 1, limit: 20)),
      expect: () => [
        TaskState.initial().copyWith(state: TaskStateEnum.loading),
        TaskState.initial().copyWith(
          state: TaskStateEnum.loaded,
          tasks: [
            TaskEntity(id: 1, title: 'Task 1', date: DateTime(2023, 1, 1), isComplete: false),
          ],
        ),
      ],
    );

    blocTest<TaskBloc, TaskState>(
      'emits [updating, loaded] when DeleteTaskEvent is added',
      build: () {
        when(mockTaskRepository.deleteTask(1)).thenAnswer((_) async {});
        return taskBloc;
      },
      seed: () => TaskState.initial().copyWith(
        tasks: [
          TaskEntity(id: 1, title: 'Task 1', date: DateTime(2023, 1, 1), isComplete: false),
          TaskEntity(id: 2, title: 'Task 2', date: DateTime(2023, 1, 2), isComplete: true),
        ],
      ),
      act: (bloc) => bloc.add(DeleteTaskEvent(1)),
      expect: () => [
        TaskState.initial().copyWith(
          state: TaskStateEnum.updating,
          tasks: [
            TaskEntity(id: 1, title: 'Task 1', date: DateTime(2023, 1, 1), isComplete: false),
            TaskEntity(id: 2, title: 'Task 2', date: DateTime(2023, 1, 2), isComplete: true),
          ],
        ),
        TaskState.initial().copyWith(
          state: TaskStateEnum.loaded,
          tasks: [
            TaskEntity(id: 2, title: 'Task 2', date: DateTime(2023, 1, 2), isComplete: true),
          ],
        ),
      ],
    );
    blocTest<TaskBloc, TaskState>(
      'emits [tasks cleared, filter updated] when ChangeFilterEvent is added',
      build: () => taskBloc,
      act: (bloc) => bloc.add(ChangeFilterEvent(FilterEnum.completed)),
      expect: () => [
        TaskState.initial().copyWith(
          currentFilter: FilterEnum.completed,
          tasks: [],
          state: TaskStateEnum.initial,
        ),
      ],
    );
  });
}
