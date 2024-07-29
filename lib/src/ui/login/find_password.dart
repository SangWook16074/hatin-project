import 'package:flutter/material.dart';
import 'package:hatin/src/ui/login/issue_password.dart';
import 'package:hatin/src/widget/black_Button.dart';
import 'package:hatin/src/widget/hattin_image_icon.dart';
import 'package:hatin/src/widget/user_text_field.dart';

class FindPassword extends StatefulWidget {
  const FindPassword({super.key});

  @override
  State<FindPassword> createState() => _FindPasswordState();
}

class _FindPasswordState extends State<FindPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() => AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
      );

  Widget _body() => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            _text(),
            _leftImage(),
            _findPassword(),
            _sendBtn(),
          ],
        ),
      );

  Widget _text() => const SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "비밀번호를 잊어버렸나요?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xff111111),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.8),
                child: Text(
                  "비밀번호 찾기",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff9B9B9B),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _leftImage() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: 194,
          height: 129,
          child: FittedBox(
            fit: BoxFit.contain,
            child: HattinImageIcon(path: ImagePath.findEmail),
          ),
        ),
      ),
    );
  }

  Widget _findPassword() => const UserTextField(
      label: "이메일", hintText: "해당 계정의 이메일을 입력해주세요.", isPassword: false);

  Widget _sendBtn() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: BlackButton(
          buttonWidth: 84,
          buttonHeight: 45,
          label: "전송",
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const IssuePassword()));
          },
        ),
      );
}
