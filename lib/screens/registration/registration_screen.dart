import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kazzbuzz/screens/registration/registration_form.dart';
import 'package:kazzbuzz/screens/registration/registration_image_pickers.dart';
import 'package:kazzbuzz/utils/assets.dart';
import 'package:kazzbuzz/widgets/custom_elevated_button.dart';
import 'package:kazzbuzz/widgets/successful_dialog.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String gender = 'Male';
  String category = 'Category 1';
  final Color bgColor = const Color(0xffF1f5ff);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? frontImage;
  File? backImage;
  bool disabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const Text('Please fill in the following information'),
            const SizedBox(height: 20),
            RegistrationForm(
              nameController: _nameController,
              emailController: _emailController,
              phoneController: _phoneController,
              category: category,
              gender: gender,
              formKey: _formKey,
            ),
            const SizedBox(height: 20),
            CustomElevatedButton(
              text: 'Save',
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await successfulDialog(
                    context,
                    'Your registration was successful. Thank you for becoming a member',
                    null,
                  );
                }
              },
              disabled: disabled,

              /// Use form validation to change the value of disabled
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.grey.withOpacity(0.5),
              width: double.infinity,
              height: 30,
              child: Center(
                child: Image.asset(Assets.rectangleIcon),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            RegistrationImagePickers(
              frontImage: frontImage,
              backImage: backImage,
            ),
          ],
        ),
      ),
    );
  }
}
