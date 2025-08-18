import 'package:flutter_learn_2025/todo_app/auth/user.dart';
import 'package:flutter_learn_2025/todo_app/auth/user_service.dart';
import 'package:uuid/uuid.dart';

class CreateAccountViewModel {
  CreateAccountViewModel(UserService userService) : _userService = userService;

  final UserService _userService;

  User? createUser(String name) {
    try {
      return _userService.createUser(User(name: name, uid: Uuid().v4()));
    } catch (e) {
      return null;
    }
  }
}
