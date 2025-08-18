part of '../index.dart';

//w warstwie data nie powinienem wykorzystywac flutter - dopiero w presentation
class TodoServiceImpl implements TodoService {
  List<Todo> _value;
  static int ctr = 0;

  TodoServiceImpl({List<Todo> data = const []}) : _value = data;

  @override
  void add(Todo item) {
    _value = [..._value, item.copyWith(id: 'id:${ctr++}')];
  }

  @override
  void remove(Todo item) {
    _value = [..._value]..removeWhere((e) => e.id == item.id);
  }

  @override
  void toggleDone(Todo item) {
    final List<Todo> newItems = [];
    for (var it in _value) {
      if (it.id == item.id) {
        newItems.add(it.copyWith(isDone: !it.isDone));
      } else {
        newItems.add(it);
      }
    }
    _value = newItems;
  }

  @override
  List<Todo> get value => _value;
}
