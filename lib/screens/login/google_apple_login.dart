import 'package:flutter/material.dart';
import 'package:kazzbuzz/utils/assets.dart';
import 'package:kazzbuzz/utils/styles.dart';

class GoogleAppleLogin extends StatelessWidget {
  const GoogleAppleLogin({
    super.key,
    required this.onGooglePressed,
    required this.onApplePressed,
    required this.enabled,
  });

  final VoidCallback onGooglePressed;
  final VoidCallback onApplePressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ActionChip(
          label: Row(
            children: [
              Image.asset(Assets.googleIcon),
              const SizedBox(width: 10),
              const Text('Google'),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Styles.blueish),
          ),
          onPressed: enabled ? onGooglePressed : null,
        ),
        const SizedBox(width: 30),
        ActionChip(
          label: Row(
            children: [
              Image.asset(Assets.appleIcon),
              const SizedBox(width: 10),
              const Text('Apple'),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Styles.blueish),
          ),
          onPressed: enabled ? onApplePressed : null,
        ),
      ],
    );
  }
}
