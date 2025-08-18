part of '../index.dart';

//warstwa domain nie powinna odwolywac sie do frameworka (flutter)
class Todo {
  const Todo({
    required this.title,
    this.isDone = false,
    this.id,
    this.category = '',
  });

  final String title;
  final String category;
  final bool isDone;
  final String? id;

  Todo copyWith({
    String? title,
    bool? isDone,
    String? id,
  }) =>
      Todo(
          id: id ?? this.id,
          isDone: isDone ?? this.isDone,
          title: title ?? this.title);
}
