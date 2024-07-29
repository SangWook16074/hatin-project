import 'package:flutter/material.dart';

class UserTextFieldIcon extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isPassword;

  const UserTextFieldIcon({
    super.key,
    required this.label,
    required this.isPassword,
    required this.hintText,
  });

  @override
  State<UserTextFieldIcon> createState() => _UserTextFieldIconState();
}

class _UserTextFieldIconState extends State<UserTextFieldIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.label,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffF1F3F5),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                obscureText: widget.isPassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_red_eye_outlined)),
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
                    color: Color(0xff9B9B9B),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
