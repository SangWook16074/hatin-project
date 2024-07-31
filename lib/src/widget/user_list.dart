import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  final String userName;
  final String followText;
  final VoidCallback onButtonPressed;
  final Color textColor;

  const UserList(
      {super.key,
      required this.userName,
      required this.onButtonPressed,
      required this.followText,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 51,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: onButtonPressed,
              child: Text(
                userName,
                style: const TextStyle(fontSize: 16, color: Color(0xff111111)),
              ),
            ),
            TextButton(
                onPressed: onButtonPressed,
                child: Text(
                  followText,
                  style: TextStyle(fontSize: 16, color: textColor),
                )),
          ],
        ),
      ),
    );
  }
}
