import 'package:flutter/material.dart';
import 'package:kazzbuzz/screens/login/google_apple_login.dart';
import 'package:kazzbuzz/screens/login/login_form.dart';
import 'package:kazzbuzz/screens/login/login_header.dart';
import 'package:kazzbuzz/screens/sign_up/signup_screen.dart';
import 'package:kazzbuzz/widgets/background_design.dart';
import 'package:kazzbuzz/widgets/custom_divider_with_text_inside.dart';
import 'package:kazzbuzz/widgets/custom_elevated_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool enabled = true;

  @override
  void initState() {
    _emailController.addListener(_setEnabled);
    _passwordController.addListener(_setEnabled);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        // alignment: Alignment.center,
        children: [
          ...backgroundImages(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                const LoginHeader(),
                const SizedBox(height: 30),
                GoogleAppleLogin(
                  onGooglePressed: () {},
                  onApplePressed: () {},
                  enabled: enabled,
                ),
                const SizedBox(height: 30),
                const CustomDivider(text: 'or'),
                const SizedBox(height: 20),
                LoginForm(
                  formKey: _formKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  text: 'Login',
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        '?Forgot Password',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _setEnabled() {
    setState(() {
      enabled =
          _emailController.text.isEmpty && _passwordController.text.isEmpty;
    });
  }
}
