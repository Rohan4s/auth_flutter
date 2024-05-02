import 'package:flutter/material.dart';
import 'package:kazzbuzz/screens/login/login_screen.dart';
import 'package:kazzbuzz/screens/registration/registration_screen.dart';
import 'package:kazzbuzz/screens/sign_up/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KazzBuzz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
