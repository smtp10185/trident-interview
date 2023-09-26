import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trident_interview/repository/user/user.dart';
import 'package:trident_interview/repository/user/user_repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  UserType? _radioUserType;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userRepository = Provider.of<UserRepository>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController, // added controller
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController, // added controller
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Instructor'),
              leading: Radio<UserType>(
                value: UserType.instructor,
                groupValue: _radioUserType,
                onChanged: (UserType? value) {
                  setState(() {
                    _radioUserType = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Student'),
              leading: Radio<UserType>(
                value: UserType.student,
                groupValue: _radioUserType,
                onChanged: (UserType? value) {
                  setState(() {
                    _radioUserType = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                switch (_radioUserType) {
                  case UserType.instructor:
                    await userRepository
                        .loginAsDummyInsturctor(
                            _usernameController.text, _passwordController.text)
                        .then((_) => context.go('/'));
                    break;
                  case UserType.student:
                    userRepository
                        .loginAsDummyStudent(
                            _usernameController.text, _passwordController.text)
                        .then((_) => context.go('/'));
                    break;
                  default:
                    // Error?
                    break;
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
