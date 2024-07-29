import 'package:flutter/material.dart';
import 'package:hatin/src/ui/login/login_signup_page2.dart';
import 'package:hatin/src/widget/hattin_image_icon.dart';

class LoginSignup1 extends StatefulWidget {
  const LoginSignup1({super.key});

  @override
  State<LoginSignup1> createState() => _LoginSignup1State();
}

class _LoginSignup1State extends State<LoginSignup1> {
  late final TextEditingController _email; // 이메일
  late final TextEditingController _password; // 비밀번호
  late final TextEditingController _passwordCheck; // 비밀번호확인

  bool _passwordVisible = false; // 비밀번호 , 보이기 안보이기 기능을 위한 passwordVisible
  bool _passwordCheckVisible =
      false; // 비밀번호확인 , 보이기 안보이기 기능을 위한 passwordCheckVisible

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
    _passwordCheck = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
    _passwordCheck.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _body(),
      backgroundColor: Colors.white,
    );
  }

  // 이메일 패스워드 검사
  void _inspection() {
    if (_email.text.isEmpty ||
        _password.text.isEmpty ||
        _passwordCheck.text.isEmpty) {
      print("이메일과 패스워드 다시 확인");
    } else if (_password.text != _passwordCheck.text) {
      print("동일 패스워드를 안침");
    } else {
      // 이메일과 패스워드를 올바르게 치면 loginSignupPage2 로 이동
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const LoginSignup2()));
    }
  }

// 앱바
  PreferredSizeWidget _appbar() {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false, // 기존 뒤로가기 비활성화
      leading: IconButton(
        // 새로운 뒤로가기 버튼 arrow_back_ios_new
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _signuptextField(), // "회원가입 , 이메일과 비밀번호를 입력해주세요"
          _centerImage(), // signupCenter 센터 이미지
          _signupemail(), // 이메일 , 입력
          _signuppassword(), // 비밀번호, 입력
          _signupckpassword(), // 비밀번호확인 , 입력
          _btnnextsignup(), // 다음단계 > GestureDetector
        ],
      ),
    );
  }

// |회원가입 , 이메일과 비밀번호를 입력해주세요| 텍스트
  Widget _signuptextField() {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 32),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              "회원가입",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 32, top: 10),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              "이메일과 비밀번호를 입력해주세요.",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w100,
                  color: Color(0xffB9B9B9)),
            ),
          ),
        ),
      ],
    );
  }

// 가운데 이미지  image name : signupCenter.png
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

// 이메일 필드
  Widget _signupemail() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 32, top: 48, right: 32),
          child: SizedBox(
              width: double.infinity,
              child: Text(
                "이메일",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 8,
            right: 20,
          ),
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xffF1F3F5),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: TextField(
                // 이메일 입력 공간
                controller: _email,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "이메일을 입력해주세요.",
                  hintStyle: TextStyle(fontSize: 14, color: Color(0xff9B9B9B)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

// 비밀번호 필드
  Widget _signuppassword() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 32, top: 24, right: 32),
          child: SizedBox(
              width: double.infinity,
              child: Text(
                "비밀번호",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 8,
            right: 20,
          ),
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xffF1F3F5),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: TextField(
                // 비밀번호 입력 공간
                controller:
                    _password, // _password와 _passwordCheck는 둘이 같은지 검사하기 위해 따로 지정
                obscureText: !_passwordVisible, // false = 비밀번호 안보임 , true = 보임
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "비밀번호를 입력해주세요.",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye_outlined,
                        color: _passwordVisible // 아이콘 클릭시 색 바뀜
                            ? const Color(0xffFE4F28) // 클릭 후 색
                            : const Color(0xff9B9B9B)), // 클릭 전 색
                    onPressed: () {
                      setState(() {
                        // false일때 안보임 , true일때는 보임
                        _passwordVisible = !_passwordVisible; // 초기값 false
                        print("$_passwordVisible");
                      });
                    },
                  ),
                  hintStyle:
                      const TextStyle(fontSize: 14, color: Color(0xff9B9B9B)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

// 비밀번호 , 텍스트필드
  Widget _signupckpassword() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 32, top: 24, right: 32),
          child: SizedBox(
              width: double.infinity,
              child: Text(
                "비밀번호 확인",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 8,
            right: 20,
          ),
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xffF1F3F5),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: TextField(
                // 비밀번호확인 입력 공간
                controller:
                    _passwordCheck, // _password 와 _passwordCheck 둘이 같은지 확인하기 위해 따로 지정
                obscureText:
                    !_passwordCheckVisible, // false = 비번 안보임, true = 비번 보임
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "동일한 비밀번호를 입력해주세요.",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye_outlined,
                        color: _passwordCheckVisible // 아이콘을 클릭 하면 아이콘 색 변함
                            ? const Color(0xffFE4F28) // 클릭 후 후
                            : const Color(0xff9B9B9B)), // 클릭 전 색
                    onPressed: () {
                      setState(() {
                        // 초기값 false(비번안보임)
                        _passwordCheckVisible =
                            !_passwordCheckVisible; // false => true, true => false
                        //print("${passwordVisible}");
                      });
                    },
                  ),
                  hintStyle:
                      const TextStyle(fontSize: 14, color: Color(0xff9B9B9B)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

// 다음단계 , 옆에 화살표 아이콘
  Widget _btnnextsignup() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 15),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  _inspection(); // 다음단계 클릭 -> 이메일 패스워드 검사 -> 올바르면 loginSignupPage2 로 이동
                },
                child: const Text(
                  "다음단계",
                  style: TextStyle(
                    color: Color(0xffFE4F28),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 2.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xffFE4F28),
                  size: 18,
                ),
              ),
            ],
          ),
        ));
  }
}
