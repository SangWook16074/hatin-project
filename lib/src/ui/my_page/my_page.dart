import 'package:flutter/material.dart';
import 'package:hatin/src/ui/my_page/follow_view.dart';
import 'package:hatin/src/ui/my_page/modify_user_info.dart';
import 'package:hatin/src/widget/follw_follwing.dart';
import 'package:hatin/src/widget/service_button.dart';
import 'package:hatin/src/widget/service_switch_button.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
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
      toolbarHeight: 40,
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications_none_outlined,
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
          _userInfo(),
          _followFollowing(),
          _post(),
          _friendsManager(),
        ],
      ),
    );
  }

  Widget _userInfo() {
    return Container(
      width: double.infinity,
      height: 70,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ModifyUserInfo(),
                      ),
                    );
                  },
                  child: const Text(
                    "바른생활김덕인",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ModifyUserInfo(),
                    ),
                  );
                },
              ),
            ],
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "induk@gmail.com",
                style: TextStyle(fontSize: 14, color: Color(0xff9B9B9B)),
              )),
        ],
      ),
    );
  }

  Widget _followFollowing() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FollwFollwing(
            label: "팔로워",
            onButtonPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FollowView()));
            }),
        const Text(
          "|",
          style: TextStyle(fontSize: 16, color: Color(0xff9B9B9B)),
        ),
        FollwFollwing(
            label: "팔로잉",
            onButtonPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FollowView()));
            }),
      ],
    );
  }

  Widget _post() {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: Column(
        children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "게시글 관리",
                style: TextStyle(fontSize: 14, color: Color(0xff9B9B9B)),
              )),
          ServiceButton(label: "내 게시글", onButtonPressed: () {}),
          ServiceButton(label: "내 댓글", onButtonPressed: () {}),
        ],
      ),
    );
  }

  Widget _friendsManager() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Column(
        children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "친구 관리",
                style: TextStyle(fontSize: 14, color: Color(0xff9B9B9B)),
              )),
          ServiceButton(label: "차단 관리", onButtonPressed: () {}),
          const ServiceSwitchButton(label: "팔로우 허락 받기"),
          const ServiceSwitchButton(label: "알림 받기"),
        ],
      ),
    );
  }
}
