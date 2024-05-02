import 'package:flutter/material.dart';
import 'package:kazzbuzz/utils/assets.dart';
import 'package:kazzbuzz/utils/styles.dart';
import 'package:kazzbuzz/widgets/circle.dart';

class RegistrationDropDownButtons extends StatefulWidget {
  RegistrationDropDownButtons({
    super.key,
    required this.category,
    required this.gender,
  });

  String gender;
  String category;

  @override
  State<RegistrationDropDownButtons> createState() =>
      _RegistrationDropDownButtonsState();
}

class _RegistrationDropDownButtonsState
    extends State<RegistrationDropDownButtons> {
  List<String> categories = ['Category 1', 'Category 2', 'Category 3'];

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
                text: 'Gender',
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
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Styles.blueish,
            ),
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width,
          child: DropdownButton<String>(
            isExpanded: true,
            items: const [
              DropdownMenuItem(
                value: 'Male',
                child: Text('Male'),
              ),
              DropdownMenuItem(
                value: 'Female',
                child: Text('Female'),
              ),
            ],
            value: widget.gender,
            underline: Container(),
            onChanged: (value) {
              setState(() {
                widget.gender = value!;
              });
            },
            icon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(Assets.dropDownIcon),
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
                text: 'Category',
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
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Styles.blueish,
            ),
            color: Colors.white,
          ),
          width: double.infinity,
          child: DropdownButton<String>(
            items: categories.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            value: widget.category,
            isExpanded: true,
            underline: Container(),
            onChanged: (value) {
              setState(() {
                widget.category = value!;
              });
            },
            icon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(Assets.dropDownIcon),
            ),
          ),
        ),
      ],
    );
  }
}
