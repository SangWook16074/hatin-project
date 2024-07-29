import 'package:flutter/material.dart';
import 'package:hatin/src/widget/select_button.dart';
import 'package:hatin/src/widget/user_list.dart';

class FollowView extends StatefulWidget {
  const FollowView({super.key});

  @override
  State<FollowView> createState() => _FollowViewState();
}

class _FollowViewState extends State<FollowView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() => AppBar(
        elevation: 0,
        title: const Text("바른생활김덕인"),
      );

  Widget _body() => Column(
        children: [
          _selectFollowFollowing(),
          Expanded(child: _userListView()),
        ],
      );

  Widget _selectFollowFollowing() {
    return const Center(
      child: SelectButton(
        titleLabel: "",
        leftLabel: "팔로워",
        rightLabel: "팔로잉",
        buttonWidth: 156,
        buttonHeight: 45,
      ),
    );
  }

  Widget _userListView() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return const UserList(userName: "인덕대학교 학생");
      },
    );
  }
}
