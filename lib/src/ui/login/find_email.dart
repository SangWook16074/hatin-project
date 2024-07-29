import 'package:flutter/material.dart';
import 'package:hatin/src/ui/login/issue_email.dart';
import 'package:hatin/src/widget/hattin_image_icon.dart';
import 'package:hatin/src/widget/user_text_field.dart';

class FindEmail extends StatefulWidget {
  const FindEmail({super.key});

  @override
  State<FindEmail> createState() => _FindEmailState();
}

class _FindEmailState extends State<FindEmail> {
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
            _findNickName(),
            _findPhoneNumber(),
            _findEmailBtn(),
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
                "이메일을 잊어버렸나요?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xff111111),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.8),
                child: Text(
                  "이메일 찾기",
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

  Widget _findNickName() => const UserTextField(
      label: "닉네임", hintText: "해당 계정의 닉네임을 입력해주세요.", isPassword: false);

  Widget _findPhoneNumber() => const UserTextField(
      label: "전화번호 ( - 제외)",
      hintText: "해당 계정의 전화번호를 입력해주세요.",
      isPassword: false);

  Widget _findEmailBtn() => TextButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IssueEmail()));
                },
                child: const Text(
                  "이메일 찾기",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                )),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          ],
        ),
      ));
}
