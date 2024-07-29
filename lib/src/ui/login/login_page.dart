import 'package:flutter/material.dart';
import 'package:hatin/src/ui/login/find_email.dart';
import 'package:hatin/src/ui/login/find_password.dart';
import 'package:hatin/src/ui/login/login_signup_page1.dart';
import 'package:hatin/src/widget/check_info_text_field.dart';
import 'package:hatin/src/widget/gradient_button.dart';
import 'package:hatin/src/widget/hattin_image_icon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _emailHasError = false;
  bool _passwordHasError = false;
  bool _rememberMe = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    setState(() {
      _emailHasError = _emailController.text.isEmpty;
      _passwordHasError = _passwordController.text.isEmpty;

      // Handle login logic if there are no errors
      if (!_emailHasError && !_passwordHasError) {
        // Perform login operation
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Stack(
            children: [
              Column(
                children: [
                  _text(),
                  _centerImage(),
                  CheckInfoTextField(
                    label: "이메일",
                    hintText: "이메일을 입력해주세요",
                    isPassword: false,
                    hasError: _emailHasError,
                    errorMessage: _emailHasError ? '이메일을 입력하세요' : '',
                    onChanged: (text) {
                      setState(() {
                        _emailHasError = text.isEmpty;
                      });
                    },
                  ),
                  CheckInfoTextField(
                    label: "비밀번호",
                    hintText: "비밀번호를 입력해주세요",
                    isPassword: true,
                    hasError: _passwordHasError,
                    errorMessage: _passwordHasError ? '비밀번호를 입력하세요' : '',
                    showPasswordToggle: true,
                    onChanged: (text) {
                      setState(() {
                        _passwordHasError = text.isEmpty;
                      });
                    },
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                        checkColor: const Color(0xffFE4F28),
                        activeColor: const Color(0xffF1F3F5),
                      ),
                      const Text(
                        '내 정보 기억하기',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff9B9B9B)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: GradientButton(
                      label: "로그인하기",
                      onPressed: _handleLogin,
                    ),
                  ),
                  btnSignup(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _text() {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "로그인",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xff111111),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.8),
              child: Text(
                "이메일과 비밀번호를 입력해주세요",
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
  }

  Widget _centerImage() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: 173,
        height: 96,
        child: FittedBox(
          fit: BoxFit.contain,
          child: HattinImageIcon(path: ImagePath.signupCenter),
        ),
      ),
    );
  }

  Widget btnSignup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FindEmail()));
          },
          child: const Text(
            "이메일 찾기",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff9b9b9b),
            ),
          ),
        ),
        const Text(
          "|",
          style: TextStyle(fontSize: 14, color: Color(0xff9b9b9b)),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FindPassword()));
          },
          child: const Text(
            "비밀번호 찾기",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff9b9b9b),
            ),
          ),
        ),
        const Text(
          "|",
          style: TextStyle(fontSize: 14, color: Color(0xff9b9b9b)),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginSignup1()));
          },
          child: const Text(
            "회원가입하기",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff9b9b9b),
            ),
          ),
        ),
      ],
    );
  }
}
