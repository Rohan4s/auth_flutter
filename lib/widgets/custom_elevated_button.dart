import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.disabled = false,
  });

  final String text;
  final VoidCallback onPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = disabled
        ? ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.5)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
          )
        : ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFF0F6CBD)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
          );

    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: buttonStyle,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
