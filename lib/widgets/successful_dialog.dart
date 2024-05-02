import 'package:flutter/material.dart';
import 'package:kazzbuzz/utils/assets.dart';
import 'package:kazzbuzz/widgets/circle.dart';

Future successfulDialog(
  BuildContext context,
  String text,
  String? subtext,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Center(
          child: Circle(
            diameter: 100,
            color: const Color(0xffF5F9FF),
            child: Image.asset(
              Assets.successfulIcon,
            ),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 30),
            const Text(
              'Congratulations!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            if (subtext != null)
              Text(
                subtext,
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 50),
          ],
        ),
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: Navigator.of(context).pop,
            ),
          ],
        ),
      );
    },
  );
}
