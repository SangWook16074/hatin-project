import 'package:flutter/material.dart';

class RoutineView extends StatelessWidget {
  const RoutineView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _todaylist(),
              _listedit(),
            ],
          ),
          _plusroutin(),
          _checkroutine(),
        ]),
      ),
    );
  }

  Widget _todaylist() {
    // 오늘 할 일
    return const Text("오늘 하루루틴");
  }

  Widget _listedit() {
    // 전체 편집 부분
    return TextButton(
      onPressed: () {},
      child: const Text("전체 편집"),
    );
  }

  Widget _plusroutin() {
    // 루틴이 보이고 옆에 아이콘을 누르면 루틴 추가 가능.
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          color: Colors.blue[900],
        )
      ],
    );
  }

  Widget _checkroutine() {
    // 빈 화면을 채울 위젯
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add_circle,
          size: 60,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("루틴을 추가해주세요!"),
        )
      ],
    );
  }
}
