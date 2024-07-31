import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hatin/src/widget/hatin_dialog.dart';
import 'package:hatin/src/widget/user_list.dart';

class BlockFriendView extends StatefulWidget {
  final int selectedTab; // 선택된 탭을 나타내는 변수

  const BlockFriendView({super.key, this.selectedTab = 0});

  @override
  State<BlockFriendView> createState() => _BlockFriendViewState();
}

class _BlockFriendViewState extends State<BlockFriendView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text("차단한 계정"),
      elevation: 0,
    );
  }

  Widget _body() => Column(
        children: [
          Expanded(child: _userListView()),
        ],
      );

  Widget _userListView() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        final userNumber = index + 1;
        return UserList(
            userName: "차단된 계정 $userNumber",
            followText: "차단해제",
            textColor: const Color(0xff9B9B9B),
            onButtonPressed: () {
              _showDeleteAccountDialog();
            });
      },
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return HatinDialog(
          commitLabel: "차단해제",
          cancelLabel: "취소",
          content: const [
            "서로의 활동을 볼 수 있으며,",
            "언제든지 차단할 수 있습니다.",
          ],
          onCommit: () {
            Navigator.of(context).pop();
            // 계정 삭제 로직 추가
          },
          onCancel: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
