part of '../index.dart';

//warstwa domain nie powinna odwolywac sie do frameworka (flutter)
abstract class TodoService {
  void add(Todo item);
  void remove(Todo item);
  void toggleDone(Todo item);
  List<Todo> get value;
}
