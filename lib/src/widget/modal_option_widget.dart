import 'package:flutter/material.dart';

class ModalOptionWidget extends StatelessWidget {
  final String optionLabel;
  final VoidCallback onTap;
  final Color color;

  const ModalOptionWidget({
    super.key,
    required this.onTap,
    required this.optionLabel,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
            width: 355,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(33),
            ),
            child: Center(
              child: Text(
                optionLabel,
                style: TextStyle(
                  fontSize: 14,
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
