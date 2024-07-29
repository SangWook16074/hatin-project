import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  final String userName;
  const UserList({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 51,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              userName,
              style: const TextStyle(fontSize: 16),
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "맞팔로우",
                  style: TextStyle(fontSize: 16),
                )),
          ],
        ),
      ),
    );
  }
}
