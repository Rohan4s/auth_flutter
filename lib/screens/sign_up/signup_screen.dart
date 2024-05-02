import 'package:flutter/material.dart';
import 'package:kazzbuzz/screens/login/google_apple_login.dart';
import 'package:kazzbuzz/screens/login/login_form.dart';
import 'package:kazzbuzz/screens/login/login_screen.dart';
import 'package:kazzbuzz/screens/otp/otp_screen.dart';
import 'package:kazzbuzz/screens/sign_up/signup_header.dart';
import 'package:kazzbuzz/widgets/background_design.dart';
import 'package:kazzbuzz/widgets/custom_divider_with_text_inside.dart';
import 'package:kazzbuzz/widgets/custom_elevated_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                const SignupHeader(),
                const SizedBox(height: 20),
                GoogleAppleLogin(
                  onGooglePressed: () {},
                  onApplePressed: () {},
                  enabled: enabled,
                ),
                const SizedBox(height: 20),
                const CustomDivider(text: 'or'),
                const SizedBox(height: 20),
                LoginForm(
                  formKey: _formKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  text: 'Register',
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const OtpScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'By clicking register you are agreeing with our Terms and Data Policy',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Login',
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
