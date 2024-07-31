import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hatin/src/widget/post.dart';
import 'package:hatin/src/widget/select_button.dart';

class MyPostView extends StatefulWidget {
  final int selectedTab;

  const MyPostView({super.key, this.selectedTab = 0});

  @override
  State<MyPostView> createState() => _MyPostViewState();
}

class _MyPostViewState extends State<MyPostView> {
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
      title: const Text("내 활동"),
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

  Widget _body() => SingleChildScrollView(
        child: Column(
          children: [
            _selectFollowFollowing(),
            const Post(userName: "바른생활김덕인"),
            const Post(userName: "바른생활김덕인"),
            const Post(userName: "바른생활김덕인"),
            const Post(userName: "바른생활김덕인"),
          ],
        ),
      );

  Widget _selectFollowFollowing() {
    return SelectButton(
      titleLabel: "",
      leftLabel: "내 게시글",
      rightLabel: "내 활동",
      buttonWidth: 156,
      buttonHeight: 45,
      alignment: Alignment.center,
      selectedTab: widget.selectedTab,
      onRightButtonPressed: () {},
    );
  }
}
