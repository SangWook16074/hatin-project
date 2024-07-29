import 'package:flutter/material.dart';

class FollwFollwing extends StatelessWidget {
  final String label;
  final VoidCallback onButtonPressed;

  const FollwFollwing({
    super.key,
    required this.label,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          TextButton(
            onPressed: onButtonPressed,
            child: Column(
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff111111),
                  ),
                ),
                const Text(
                  "76",
                  style: TextStyle(color: Color(0xff9B9B9B)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
