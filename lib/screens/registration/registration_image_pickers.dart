import 'dart:io';

import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:kazzbuzz/utils/assets.dart';
import 'package:kazzbuzz/utils/styles.dart';
import 'package:kazzbuzz/widgets/circle.dart';

class RegistrationImagePickers extends StatefulWidget {
  RegistrationImagePickers({
    super.key,
    required this.frontImage,
    required this.backImage,
  });

  File? frontImage;
  File? backImage;

  @override
  State<RegistrationImagePickers> createState() =>
      _RegistrationImagePickersState();
}

class _RegistrationImagePickersState extends State<RegistrationImagePickers> {
  bool frontImageLoaded = false;
  bool backImageLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Circle(diameter: 12),
            const SizedBox(width: 10),
            RichText(
              text: const TextSpan(
                text: 'Add NID Front Side',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                children: [
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
        GestureDetector(
          onTap: _pickFrontImage,
          child: DottedBorder(
            color: Styles.blueish,
            child: Container(
              height: 150,
              width: double.infinity,
              color: Colors.white,
              child: Center(
                child: frontImageLoaded
                    ? Image.file(widget.frontImage!)
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(Assets.imagePlaceholderIcon),
                          const SizedBox(height: 10),
                          const Text(
                            'Add NID Front Side',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Circle(diameter: 12),
            const SizedBox(width: 10),
            RichText(
              text: const TextSpan(
                text: 'Add NID Front Side',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                children: [
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
        GestureDetector(
          onTap: _pickBackImage,
          child: DottedBorder(
            color: Styles.blueish,
            child: Container(
              height: 150,
              width: double.infinity,
              color: Colors.white,
              child: Center(
                child: backImageLoaded
                    ? Image.file(widget.backImage!)
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(Assets.imagePlaceholderIcon),
                          const SizedBox(height: 10),
                          const Text(
                            'Add NID Back Side',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _pickFrontImage() {}

  void _pickBackImage() {}
}
