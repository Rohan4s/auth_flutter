import 'package:flutter/material.dart';
import 'package:kazzbuzz/utils/styles.dart';
import 'package:kazzbuzz/widgets/circle.dart';

class RegistrationTextField extends StatelessWidget {
  const RegistrationTextField({
    super.key,
    required this.fieldName,
    required this.controller,
    this.keyboardType,
    required this.hintText,
  });

  final String fieldName;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Circle(diameter: 12),
            const SizedBox(width: 10),
            RichText(
              text: TextSpan(
                text: fieldName,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                children: const [
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hintText,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Styles.blueish,
              ),
            ),
            fillColor: Colors.white,
            filled: true,
          ),
        ),
      ],
    );
  }
}
