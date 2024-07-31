import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatin/src/model/routin.dart';
import 'package:hatin/src/ui/routine/routin_add_page.dart';
import 'package:hatin/src/ui/routine/routin_modify_page.dart';
import 'package:hatin/src/ui/routine/routin_view_model.dart';
import 'package:hatin/src/widget/hatin_dialog.dart';
import 'package:provider/provider.dart';

class RoutineView extends StatefulWidget {
  const RoutineView({super.key});

  @override
  State<RoutineView> createState() => _RoutineViewState();
}

class _RoutineViewState extends State<RoutineView> {
  int? selectedRoutineIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: AppBar().preferredSize.height * 3,
        ),
        _header(),
        _addRoutin(),
        _dailyRoutins(),
        const SizedBox(
          height: 120,
        )
      ]),
    );
  }

  Widget _header() => SizedBox(
        height: AppBar().preferredSize.height,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "오늘 하루루틴",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  key: const Key("전체 편집"),
                  onTap:
                      Provider.of<RoutinViewModel>(context, listen: false).edit,
                  child: const Text(
                    "전체 편집",
                    style: TextStyle(color: Color(0xffa8a8a8)),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget _addRoutin() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const RoutinAddPage()));
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 22.0),
            width: double.infinity,
            height: 86,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xffFF3D3D), Color(0xffFF7354)]),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "루틴 추가하기",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.add,
                    color: Color(0xffb9b9b9),
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  Widget _dailyRoutins() => Consumer<RoutinViewModel>(
        builder: (context, provider, child) => Column(
          children: List.generate(
            provider.routins.length,
            (index) {
              final Routin routin = provider.routins[index];
              return Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedRoutineIndex == index) {
                          selectedRoutineIndex = null;
                        } else {
                          selectedRoutineIndex = index;
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 4.0),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        height: 86,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  routin.name,
                                  style: const TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  routin.startAt,
                                  style:
                                      const TextStyle(color: Color(0xffb9b9b9)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (selectedRoutineIndex == index)
                    Positioned(
                      top: 12,
                      right: 30,
                      child: _buildEditDeleteBox(),
                    ),
                ],
              );
            },
          ),
        ),
      );

  Widget _buildEditDeleteBox() {
    return Container(
      width: 50,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RoutinModifyPage()));
            },
            child: const Text(
              "수정",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            key: const Key("RoutinDelBtn"),
            onTap: () {
              _showDeleteAccountDialog();
            },
            child: const Text(
              "삭제",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return HatinDialog(
          commitLabel: "삭제",
          cancelLabel: "취소",
          content: const [
            "루틴의 모든 기록이",
            "영구적으로 삭제됩니다.",
            "",
            "정말 삭제하시겠습니까?",
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
