import 'package:flutter/material.dart';
import 'package:hatin/src/ui/login/login_page.dart';

class IssueEmail extends StatefulWidget {
  const IssueEmail({super.key});

  @override
  State<IssueEmail> createState() => _IssueEmailState();
}

class _IssueEmailState extends State<IssueEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  Widget _body() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _checkIcon(),
            const SizedBox(height: 150),
            _loginBtn(),
          ],
        ),
      );

  Widget _checkIcon() => const Column(
        children: [
          Center(
            child: Icon(
              Icons.check_circle,
              size: 42,
              color: Color(0xffFE4F28),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "이메일을 알려드립니다.\nHatin_Induk@gmail.com",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xff111111),
              ),
            ),
          ),
        ],
      );

  Widget _loginBtn() => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: const Text(
                  "로그인 하기",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xffFE4F28),
                    fontWeight: FontWeight.w600,
                  ),
                )),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Color(0xffFE4F28),
            ),
          ],
        ),
      );
}
