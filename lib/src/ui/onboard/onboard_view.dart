import 'package:flutter/material.dart';
import 'package:hatin/src/ui/app/app.dart';
import 'package:hatin/src/ui/login/login_page.dart';
import 'package:hatin/src/ui/login/login_signup_page1.dart';
import 'package:hatin/src/widget/gradient_button.dart';
import 'package:hatin/src/widget/custom_outlined_button.dart';
import 'package:hatin/src/widget/hattin_image_icon.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _logo(),
            _discription(),
            _buttons(),
            _notLoginBtn(),
          ],
        ),
      ),
    );
  }

  /// 로그인 화면 상단
  /// 아이콘들
  Widget _logo() => Flexible(
        flex: 7,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: HattinImageIcon(path: ImagePath.onboardLogo)),
      );

  /// 앱 중단 설명 부분
  Widget _discription() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    child: HattinImageIcon(path: ImagePath.logo),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.0),
                    child: Text(
                      "Hatin",
                      style: TextStyle(
                          color: Color(0xffb9b9b9),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  Text(
                    "오늘의 하루 루틴이\n내일의 성공이 될 수 있게",
                    style: TextStyle(
                      color: Color(0xff111111),
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  Text(
                    "더 완벽한 하루를 위해 루틴을 세워보세요.\n목표를 향한 첫 걸음을 우리와 함께해요.",
                    style: TextStyle(
                        color: Color(0xffb9b9b9),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  /// 로그인 및 회원가입 버튼
  Widget _buttons() => Flexible(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: GradientButton(
                  label: "로그인하기",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: CustomOutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginSignup1(),
                        ),
                      );
                    },
                    label: "회원가입"),
              ),
            ],
          ),
        ),
      );

  Widget _notLoginBtn() => Padding(
        padding: const EdgeInsets.only(left: 10),
        child: TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const App()));
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "건너뛰기",
                  style: TextStyle(
                    color: Color(0xff9B9B9B),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Color(0xff9B9B9B),
                ),
              ],
            )),
      );
}
