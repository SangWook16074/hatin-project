import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hatin/src/ui/friend/follow_friend.dart';
import 'package:hatin/src/ui/my_page/following_view.dart';
import 'package:hatin/src/widget/select_button.dart';
import 'package:hatin/src/widget/user_list.dart';

class FollowView extends StatefulWidget {
  final int selectedTab; // 선택된 탭을 나타내는 변수

  const FollowView({super.key, this.selectedTab = 0});

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

  AppBar _appBar() {
    return AppBar(
      title: const Text("인덕대학교 팔로우"),
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.more_horiz,
            size: 30,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _body() => Column(
        children: [
          _selectFollowFollowing(),
          Expanded(child: _userListView()),
        ],
      );

  Widget _selectFollowFollowing() {
    return SelectButton(
      titleLabel: "",
      leftLabel: "팔로워",
      rightLabel: "팔로잉",
      buttonWidth: 156,
      buttonHeight: 45,
      alignment: Alignment.center,
      selectedTab: widget.selectedTab,
      onRightButtonPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FollowingView()),
        );
      },
    );
  }

  Widget _userListView() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return UserList(
            userName: "인덕대학교 팔로우",
            followText: "맞팔로우",
            textColor: const Color(0xffFE4F28),
            onButtonPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FollowFriend(),
                ),
              );
            });
      },
    );
  }
}
