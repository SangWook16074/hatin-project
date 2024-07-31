import 'package:flutter/material.dart';

class UserTextFieldButton extends StatelessWidget {
  final String label;
  final String buttonTitle;
  final VoidCallback onButtonPressed;

  const UserTextFieldButton({
    super.key,
    required this.label,
    required this.buttonTitle,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                label,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF1F3F5),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Color(0xff9B9B9B),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8.0), // TextField와 버튼 사이의 간격
              ElevatedButton(
                onPressed: onButtonPressed, // 버튼이 눌렸을 때의 동작
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // 버튼 모서리 둥글게
                  ),
                  minimumSize: const Size(64, 45), // 버튼의 최소 크기 (폭, 높이)
                ),
                child: Text(buttonTitle),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
