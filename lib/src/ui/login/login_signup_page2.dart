import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginSignup2 extends StatefulWidget {
  const LoginSignup2({super.key});

  @override
  State<LoginSignup2> createState() => _LoginSignup2State();
}

class _LoginSignup2State extends State<LoginSignup2> {
  final List<String> _gender = [
    // 성별 여자, 남자 List.generate 배열 쓰기위한 List
    "여자",
    "남자"
  ];

  final List<bool> _genderColor =
      List<bool>.filled(2, false); // 클릭시 색이 변경되기 위한 genderColor

  late final TextEditingController _nickname;
  late final TextEditingController _birthday;
  late final TextEditingController _address;
  late final TextEditingController _phoneNumber;

  @override
  void initState() {
    super.initState();
    _nickname = TextEditingController();
    _birthday = TextEditingController();
    _address = TextEditingController();
    _phoneNumber = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nickname.dispose();
    _birthday.dispose();
    _address.dispose();
    _phoneNumber.dispose();
  }

  void genderCheck() {
    // 여자, 남자 둘다 선택 되었거나 선택 되지않았는지 검사
    if (_genderColor[0] ^ _genderColor[1]) {
      // 여자와 남자중 하나만 선택 되면
      Navigator.of(context).pop(); // 뒤로가기(임시로 정함)
    } else {
      print("여자 남자 둘다 선택되었거나 선택 되지 않아 Navigator를 진행 하지 않습니다.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _singupBtn(), // 회원가입하기 floatingActionButton
    );
  }

  PreferredSizeWidget _appBar() {
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _signupText(), // "더 많은 회원 정보가 필요해요! , 회원가입" 텍스트 부분
          _signupNickName(), // 닉네임 , 입력칸, 중복확인
          _signupGender(), // 성별 , 여자 남자
          _signupBirth(), // 생년월일 , 기입
          _signupAddress(), // 주소
          _signupPhoneNumber(), // 전화번호
          const SizedBox(
            width: 0,
            height: 150,
          ),
        ],
      ),
    );
  }

// 좌측 상단 텍스트 부분 "더 많은 회원 정보가 필요해요! , 회원가입"
  Widget _signupText() {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 32),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              "더 많은 회원 정보가 필요해요!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 32, top: 10),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              "회원가입.",
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

// 닉네임 필드 부분
  Widget _signupNickName() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 32, top: 30, right: 32),
          child: SizedBox(
              width: double.infinity,
              child: Text(
                "닉네임",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
        ),
        Row(
          // 닉네임 입력 공간 , 중복확인 버튼
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 8,
                  right: 10,
                ),
                child: Container(
                  width: 445,
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
                      controller: _nickname,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "닉네임을 입력해주세요.",
                        hintStyle:
                            TextStyle(fontSize: 14, color: Color(0xff9B9B9B)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              // 중복확인 버튼
              padding: const EdgeInsets.only(top: 8, right: 20),
              child: GestureDetector(
                child: Container(
                  width: 88,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(68),
                      color: Colors.black),
                  child: const Center(
                    child: Text(
                      "중복확인",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
                onTap: () {
                  print("click 됨");
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

// 성별 선택
  Widget _signupGender() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 32, top: 30),
          //padding: EdgeInsets.all(8),
          child: SizedBox(
              width: double.infinity,
              child: Text(
                "성별",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
        ),
        Padding(
          // 성별을 고르는 버튼
          padding: const EdgeInsets.only(left: 20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                _gender.length, // ["여자 , 남자"] 배열의 길이로 만듦
                (index) => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4, top: 8),
                      child: GestureDetector(
                        child: Container(
                          width: 64,
                          height: 45,
                          decoration: BoxDecoration(
                            color:
                                _genderColor[index] // 2개의 false 배열로 , 클릭시 색이 변함
                                    ? const Color(0xff111111) // 클릭 후 색
                                    : const Color(0xffF1F3F5), // 기존색
                            borderRadius: BorderRadius.circular(68.0),
                          ),
                          child: Center(
                            child: Text(
                              _gender[index],
                              style: TextStyle(
                                  color: _genderColor[index] // 위와 동일함
                                      ? Colors.white // 클릭 후 색
                                      : const Color(0xff9B9B9B), // 기존색
                                  fontSize: 14),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            // 클릭시 false => true , true => false 로 반환함
                            _genderColor[index] = !_genderColor[index];
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }

// 생년월일 선택
  Widget _signupBirth() {
    DateTime initialDay = DateTime.now();
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 32, top: 30, right: 32),
          child: SizedBox(
              width: double.infinity,
              child: Text(
                "생년월일",
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
                // 생년월일 선택공간
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText:
                      "${initialDay.year}.${initialDay.month}.${initialDay.day}",
                  hintStyle:
                      const TextStyle(fontSize: 14, color: Color(0xff9B9B9B)),
                ),
                onTap: () {
                  setState(() async {
                    // 임시로 지정, 잘 작동함
                    final DateTime? dateTime = await showDatePicker(
                        context: context,
                        initialDate: initialDay,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(3000));
                    if (dateTime != null) {
                      setState(() {
                        initialDay = dateTime;
                      });
                    }
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

// 주소 입력 필드
  Widget _signupAddress() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 32, top: 30, right: 32),
          child: SizedBox(
              width: double.infinity,
              child: Text(
                "주소",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 8,
                  right: 10,
                ),
                child: Container(
                  width: 267,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xffF1F3F5),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "우편번호",
                        hintStyle:
                            TextStyle(fontSize: 14, color: Color(0xff9B9B9B)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 20),
              child: GestureDetector(
                child: Container(
                  width: 64,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(68),
                      color: Colors.black),
                  child: const Center(
                    child: Text(
                      "검색",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
                onTap: () {
                  print("click 됨");
                },
              ),
            ),
          ],
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
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "도로명 주소 혹은 지번 주소",
                  hintStyle: TextStyle(fontSize: 14, color: Color(0xff9B9B9B)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

// 전화번호 필드
  Widget _signupPhoneNumber() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 32, top: 30, right: 32),
          child: SizedBox(
              width: double.infinity,
              child: Text(
                "전화번호 (- 제외)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 8,
                  right: 10,
                ),
                child: Container(
                  width: 243,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xffF1F3F5),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "01012345678",
                        hintStyle:
                            TextStyle(fontSize: 14, color: Color(0xff9B9B9B)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 20),
              child: GestureDetector(
                child: Container(
                  width: 88,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(68),
                      color: Colors.black),
                  child: const Center(
                    child: Text(
                      "중복확인",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
                onTap: () {
                  print("click 됨");
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _singupBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: FloatingActionButton.extended(
            backgroundColor: const Color(0xffFe4F28),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {
              genderCheck(); // 일단은 성별 기준으로 Navigator를 작동하도록 함 , 여자 남자는 둘 다 선택될 수 없음
            },
            label: const Text(
              "회원가입하기",
              style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
            )),
      ),
    );
  }
}
