import 'package:flutter/material.dart';
import 'package:hatin/src/ui/my_page/follow_view.dart';
import 'package:hatin/src/widget/black_Button.dart';
import 'package:hatin/src/widget/follw_follwing.dart';
import 'package:hatin/src/widget/post.dart';

class FollowFriend extends StatefulWidget {
  const FollowFriend({super.key});

  @override
  State<FollowFriend> createState() => _FollowFriendState();
}

class _FollowFriendState extends State<FollowFriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: _body(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("인덕대학교 팔로우"),
      toolbarHeight: 40,
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

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _followFollowing(),
          _feiendPost(),
        ],
      ),
    );
  }

  Widget _followFollowing() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FollwFollwing(
                  label: "팔로워",
                  onButtonPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FollowView()));
                  }),
              const Text(
                "|",
                style: TextStyle(fontSize: 16, color: Color(0xff9B9B9B)),
              ),
              FollwFollwing(
                  label: "팔로잉",
                  onButtonPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FollowView()));
                  }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: BlackButton(
              label: "맞팔로우",
              buttonWidth: 156,
              buttonHeight: 45,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _feiendPost() => const Column(
        children: [
          Post(
            userName: "인덕대학교 재학생",
          ),
          Post(userName: "인덕대학교 복학생")
        ],
      );
}
