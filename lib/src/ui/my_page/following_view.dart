import 'package:flutter/material.dart';
import 'package:hatin/src/ui/my_page/follow_view.dart';
import 'package:hatin/src/widget/select_button.dart';
import 'package:hatin/src/widget/user_list.dart';

class FollowingView extends StatefulWidget {
  final int selectedTab;

  const FollowingView({super.key, this.selectedTab = 1}); // 기본값을 1로 설정

  @override
  State<FollowingView> createState() => _FollowingViewState();
}

class _FollowingViewState extends State<FollowingView> {
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
    return SelectButton(
      titleLabel: "",
      leftLabel: "팔로워",
      rightLabel: "팔로잉",
      buttonWidth: 156,
      buttonHeight: 45,
      alignment: Alignment.center,
      selectedTab: widget.selectedTab,
      onLeftButtonPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const FollowView()));
      },
    );
  }

  Widget _userListView() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return UserList(
            userName: "인덕대학교 팔로잉",
            followText: "",
            textColor: Colors.white,
            onButtonPressed: () {});
      },
    );
  }
}
