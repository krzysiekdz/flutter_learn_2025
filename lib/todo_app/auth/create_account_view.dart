// import 'package:flutter/material.dart';
// import 'package:flutter_learn_2025/todo_app/auth/create_account_view_model.dart';
// import 'package:flutter_learn_2025/todo_app/auth/user_service.dart';
// import 'package:flutter_learn_2025/todo_app/utils/locator.dart';

// class CreateAccountView extends StatefulWidget {
//   const CreateAccountView({super.key});

//   @override
//   State<CreateAccountView> createState() => _CreateAccountViewState();
// }

// class _CreateAccountViewState extends State<CreateAccountView> {
//   late final CreateAccountViewModel createAccountViewModel;
//   late final TextEditingController nameController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     createAccountViewModel = CreateAccountViewModel(locator<UserService>());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text('Create Account Lesson'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DatabasePage(
//                     userService: locator<UserService>(),
//                   ),
//                 ),
//               );
//             },
//             child: const Text('Show Database'),
//           ),
//         ],
//       ),
//       body: Center(
//         child: ConstrainedBox(
//           constraints: BoxConstraints(maxWidth: 300),
//           child: Column(
//             spacing: 8,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                 ),
//                 controller: nameController,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a name';
//                   }
//                   return null;
//                 },
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (nameController.text.isNotEmpty) {
//                     final userCreated =
//                         createAccountViewModel.createUser(nameController.text);

//                     if (userCreated == null) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text('User not created'),
//                         ),
//                       );
//                       return;
//                     }

//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text(
//                             'User created, click database viewer in top right to see users'),
//                       ),
//                     );
//                     nameController.clear();
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Please enter a name'),
//                       ),
//                     );
//                   }
//                 },
//                 child: Text('Create Account'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
