import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kazzbuzz/screens/registration/drop_down_buttons.dart';
import 'package:kazzbuzz/screens/registration/registration_text_field.dart';

class RegistrationForm extends StatefulWidget {
  RegistrationForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.category,
    required this.gender,
    required this.formKey,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  String gender;
  String category;
  final GlobalKey<FormState> formKey;

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          RegistrationTextField(
            fieldName: 'Name',
            controller: widget.nameController,
            hintText: 'Enter your name here',
          ),
          const SizedBox(height: 20),
          RegistrationTextField(
            fieldName: 'Email',
            controller: widget.emailController,
            hintText: 'Enter your email here',
          ),
          const SizedBox(height: 20),
          RegistrationTextField(
            fieldName: 'Phone',
            controller: widget.phoneController,
            hintText: 'Enter your phone number here',
          ),
          const SizedBox(height: 20),
          RegistrationDropDownButtons(
            category: widget.category,
            gender: widget.gender,
          ),
        ],
      ),
    );
  }
}
