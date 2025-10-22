import 'package:flutter_learn_2025/workout_app/auth/create_account_view.dart';
import 'package:flutter_learn_2025/workout_app/auth/login_view_model.dart';
import 'package:flutter_learn_2025/workout_app/auth/user_service.dart';
import 'package:flutter_learn_2025/workout_app/core/locator.dart';
import 'package:flutter_learn_2025/workout_app/dataviewer/data_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final LoginViewModel loginViewModel;
  late final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loginViewModel = LoginViewModel(userService: locator<UserService>());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Workout Tracker'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DataView(),
                ),
              );
            },
            child: const Text('Show Database'),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 300),
          child: Column(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty) {
                    final userCreated =
                        loginViewModel.login(nameController.text);
                    if (userCreated == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('No user associated with this name'),
                        ),
                      );
                      return;
                    }

                    nameController.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a name'),
                      ),
                    );
                  }
                },
                child: Text('Login'),
              ),
              TextButton(
                child: const Text('Create Account'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateAccountView()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
