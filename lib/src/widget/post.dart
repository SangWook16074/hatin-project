import 'package:flutter/material.dart';
import 'package:hatin/src/widget/hattin_image_icon.dart';
import 'package:hatin/src/widget/modal_option_widget.dart';

class Post extends StatefulWidget {
  final String userName;
  const Post({
    super.key,
    required this.userName,
  });

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: 311,
        height: 189,
        child: Column(
          children: [
            _topView(),
            _feed(),
            const Spacer(),
            _bottomView(),
          ],
        ),
      ),
    );
  }

  Widget _topView() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                widget.userName,
                style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff111111),
                    fontWeight: FontWeight.w600),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5, left: 5),
                child: Text(
                  "1시간",
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff9B9B9B),
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Container(
                      child: Wrap(children: [
                        ModalOptionWidget(
                          onTap: () {},
                          optionLabel: "공유",
                          color: const Color(0xff111111),
                        ),
                        ModalOptionWidget(
                          onTap: () {},
                          optionLabel: "차단",
                          color: const Color(0xffFF3D3D),
                        ),
                        ModalOptionWidget(
                          onTap: () {},
                          optionLabel: "신고",
                          color: const Color(0xffFF3D3D),
                        ),
                        ModalOptionWidget(
                          onTap: () {},
                          optionLabel: "취소",
                          color: const Color(0xff111111),
                        ),
                      ]),
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      );

  Widget _feed() => const Padding(
        padding: EdgeInsets.only(top: 8),
        child: Text(
          "안녕하세요, 여러분!오늘은 비가 와서 운동을 쉬기로 했어요. 요즘 날씨가 정말 변덕스러워서, 어제까지는 더웠는데 오늘은 갑자기 비가 내리네요. 그래도 비가 내리는 날,",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      );

  Widget _bottomView() => Container(
        width: 311,
        height: 33,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(33),
            color: const Color(0xffF1F3F5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: HattinImageIcon(
                    path: ImagePath.love,
                  ),
                  iconSize: 17,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 2),
                const Text(
                  "370",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: HattinImageIcon(
                    path: ImagePath.chat,
                  ),
                  iconSize: 17,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 2),
                const Text(
                  "370",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: HattinImageIcon(
                    path: ImagePath.share,
                  ),
                  iconSize: 17,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const Text(
                  "370",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
