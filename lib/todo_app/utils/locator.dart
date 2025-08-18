import 'package:flutter_learn_2025/todo_app/todo/index.dart'
    show TodoServiceImpl, Todo;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(TodoServiceImpl(data: [
    Todo(title: 'Posprzątać pokój', id: '1'),
    Todo(title: 'Skosić trawnik', id: '2'),
    Todo(title: 'Odkurzyć basen', id: '3'),
  ]));
}
