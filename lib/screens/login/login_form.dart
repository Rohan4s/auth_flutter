import 'package:flutter/material.dart';
import 'package:kazzbuzz/utils/styles.dart';
import 'package:kazzbuzz/widgets/circle.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          const Row(
            children: [
              Circle(diameter: 10),
              SizedBox(width: 10),
              Text('Email or phone number')
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: widget.emailController,
            decoration: const InputDecoration(
              labelText: 'Enter your email or phone number here',
              fillColor: Color(0xffF5F9FF),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Styles.blueish),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Circle(diameter: 10),
              SizedBox(width: 10),
              Text('Password')
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: widget.passwordController,
            obscureText: _obscureText,
            decoration: InputDecoration(
              labelText: 'Enter your password here',
              fillColor: const Color(0xffF5F9FF),
              filled: true,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Styles.blueish),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () => setState(() => _obscureText = !_obscureText),
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
