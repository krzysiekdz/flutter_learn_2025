import 'package:flutter_learn_2025/workout_app/auth/user.dart';
import 'package:flutter_learn_2025/workout_app/auth/user_service.dart';
import 'package:flutter/material.dart';

class LoginViewModel {
  LoginViewModel({required UserService userService})
      : _userService = userService;

  final UserService _userService;

  ValueNotifier<User?> get userNotifier => _userService.userNotifier;

  User? login(String name) {
    try {
      return _userService.signIn(name);
    } catch (e) {
      return null;
    }
  }
}
