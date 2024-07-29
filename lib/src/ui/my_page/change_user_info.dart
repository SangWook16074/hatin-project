import 'package:flutter/material.dart';
import 'package:hatin/src/widget/black_Button.dart';
import 'package:hatin/src/widget/nomal_text_field.dart';
import 'package:hatin/src/widget/select_button.dart';
import 'package:hatin/src/widget/user_text_field.dart';
import 'package:hatin/src/widget/user_text_field_button.dart';

class ChangeUserInfo extends StatefulWidget {
  const ChangeUserInfo({super.key});

  @override
  State<ChangeUserInfo> createState() => _ChangeUserInfoState();
}

class _ChangeUserInfoState extends State<ChangeUserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(child: _body()),
          _bottomButton(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("회원정보 변경"),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 24,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            _changeEmail(),
            _changeGender(),
            _changeBirthday(),
            _changeAddress(),
            _changePhoneNumber(),
          ],
        ),
      ),
    );
  }

  Widget _changeEmail() {
    return UserTextFieldButton(
        label: "이메일", buttonTitle: "중복확인", onButtonPressed: () {});
  }

  Widget _changeGender() {
    return const SelectButton(
      titleLabel: "성별",
      leftLabel: "여자",
      rightLabel: "남자",
      buttonWidth: 64,
      buttonHeight: 45,
    );
  }

  Widget _changeBirthday() {
    return const UserTextField(label: "생년월일", hintText: "", isPassword: false);
  }

  Widget _changeAddress() {
    return Column(
      children: [
        UserTextFieldButton(
            label: "주소", buttonTitle: "검색", onButtonPressed: () {}),
        const NomalTextField(),
        const NomalTextField(),
      ],
    );
  }

  Widget _changePhoneNumber() {
    return UserTextFieldButton(
        label: "전화번호 ( - 제외 )", buttonTitle: "중복확인", onButtonPressed: () {});
  }

  Widget _bottomButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: BlackButton(
        buttonWidth: double.infinity,
        buttonHeight: 56,
        label: "변경하기",
        onPressed: () {},
      ),
    );
  }
}
