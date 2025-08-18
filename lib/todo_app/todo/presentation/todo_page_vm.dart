part of '../index.dart';

enum TodoShow { all, done, todo }

class TodoPageViewState {
  final TodoShow showLevel;
  final String category;
  final List<Todo> items;

  const TodoPageViewState(
      {this.showLevel = TodoShow.all,
      this.category = '',
      this.items = const []});

  TodoPageViewState copyWith(
          {TodoShow? showLevel, String? category, List<Todo>? items}) =>
      TodoPageViewState(
          showLevel: showLevel ?? this.showLevel,
          category: category ?? this.category,
          items: items ?? this.items);
}

class TodoPageViewModel {
  final TodoService todoService;
  final ValueNotifier<TodoPageViewState> stateNotifier =
      ValueNotifier(TodoPageViewState());
  TodoPageViewModel(this.todoService);

  void init({TodoPageViewState? initialState}) {
    if (initialState != null) stateNotifier.value = initialState;
    stateNotifier.value =
        stateNotifier.value.copyWith(items: todoService.value);
  }

  void add(Todo item) {
    todoService.add(item);
    updateFromTodoService();
  }

  void remove(Todo item) {
    todoService.remove(item);
    updateFromTodoService();
  }

  void toggleDone(Todo item) {
    todoService.toggleDone(item);
    updateFromTodoService();
  }

  void updateFromTodoService() {
    stateNotifier.value =
        stateNotifier.value.copyWith(items: todoService.value);
  }
}
