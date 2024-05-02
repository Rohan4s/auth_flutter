import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kazzbuzz/utils/styles.dart';

class OtpField extends StatefulWidget {
  const OtpField({
    super.key,
    required this.textControllers,
    required this.focusNodes,
    required this.formKey,
  });

  final List<TextEditingController> textControllers;
  final List<FocusNode> focusNodes;
  final GlobalKey<FormState> formKey;

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 7;
    return Form(
      key: widget.formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i < 4; i++)
            _singleDigitField(
              controller: widget.textControllers,
              focusNode: widget.focusNodes,
              index: i,
              width: width,
            ),
        ],
      ),
    );
  }

  Widget _singleDigitField({
    required List<TextEditingController> controller,
    required double width,
    required List<FocusNode> focusNode,
    required int index,
  }) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller[index],
        focusNode: focusNode[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [MyTextInputFormatter()],
        onChanged: (value) {
          if (value.isNotEmpty) {
            controller[index].text =
                value; // Replace the old value with the new one
          }
        },
        decoration: const InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Styles.blueish),
          ),
        ),
        onFieldSubmitted: (value) {
          if (index < 3) {
            focusNode[index + 1].requestFocus();
          }
        },
      ),
    );
  }
}

class MyTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 1) {
      return const TextEditingValue().copyWith(text: newValue.text[1]);
    }
    return newValue;
  }
}
