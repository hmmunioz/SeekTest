import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final int? id;
  final String title;
  final DateTime date;
  final bool isComplete;

  const TaskEntity({
    this.id,
    required this.title,
    required this.date,
    required this.isComplete,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date.toIso8601String(),
      'isComplete': isComplete ? 1 : 0,
    };
  }

  factory TaskEntity.fromMap(Map<String, dynamic> map) {
    return TaskEntity(
      id: map['id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      isComplete: map['isComplete'] == 1,
    );
  }

  TaskEntity markAsComplete() {
    return TaskEntity(
      id: id,
      title: title,
      date: date,
      isComplete: true,
    );
  }

  @override
  List<Object?> get props => [id, title, date, isComplete];
}
