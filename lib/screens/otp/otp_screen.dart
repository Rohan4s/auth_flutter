import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kazzbuzz/screens/registration/registration_screen.dart';
import 'package:kazzbuzz/widgets/circle.dart';
import 'package:kazzbuzz/widgets/custom_elevated_button.dart';
import 'package:kazzbuzz/widgets/otp_field.dart';
import 'package:kazzbuzz/widgets/successful_dialog.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _textControllers = [];
  final List<FocusNode> _focusNodes = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String number = '019734893746';
  bool disabled = true;

  @override
  void initState() {
    for (int i = 0; i < 4; i++) {
      _textControllers.add(TextEditingController());
      _focusNodes.add(FocusNode());
      _textControllers[i].addListener(() => _setDisabled());
    }
    super.initState();
  }

  @override
  void dispose() {
    for (int i = 0; i < 4; i++) {
      _textControllers[i].dispose();
      _focusNodes[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const Text(
                    'OTP Verification',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Circle(
                    diameter: 60,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Please enter the code we just sent to this number',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  OtpField(
                    textControllers: _textControllers,
                    focusNodes: _focusNodes,
                    formKey: _formKey,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: RichText(
                        text: TextSpan(
                      text: 'If you didn\'t receive the code ',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: 'Resend',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => _resendCode(),
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomElevatedButton(
                text: 'Continue',
                onPressed: () async {
                  await successfulDialog(
                    context,
                    'Your OTP verification was successful.',
                    'Thank you!',
                  );
                  if (context.mounted) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const RegistrationScreen(),
                    ));
                  }
                },
                disabled: disabled,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _setDisabled() {
    int matchingCount = 0;
    for (int i = 0; i < 4; i++) {
      if (_textControllers[i].text.isEmpty) {
        // check if otp is correct here
        setState(() {
          disabled = true;
        });
      } else {
        matchingCount++;
      }
    }
    if (matchingCount == 4) {
      setState(() {
        disabled = false;
      });
    }
  }

  void _resendCode() {
    print('Resend');
  }
}
