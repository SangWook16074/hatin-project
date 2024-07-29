import 'package:flutter/material.dart';

class BlackButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final double buttonWidth;
  final double buttonHeight;
  const BlackButton(
      {super.key,
      this.onPressed,
      required this.label,
      required this.buttonWidth,
      required this.buttonHeight})
      : assert(onPressed != null, "액션 함수를 반드시 지정해야 합니다 onPressed is Null");

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      highlightColor: Colors.white.withOpacity(0.5),
      borderRadius: BorderRadius.circular(36.0),
      child: Ink(
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36.0),
          color: Colors.black,
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
