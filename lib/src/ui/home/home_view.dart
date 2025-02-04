import 'package:flutter/material.dart';
import 'package:hatin/src/ui/routine/routine_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  final _tabs = <Tab>[
    // 요일 선택
    const Tab(
      child: Text(
        "일",
        style: TextStyle(color: Colors.red),
      ),
    ),
    const Tab(text: "월"),
    const Tab(text: "화"),
    const Tab(text: "수"),
    const Tab(text: "목"),
    const Tab(text: "금"),
    const Tab(
        child: Text(
      "토",
      style: TextStyle(color: Colors.red),
    )),
  ];
  late final TabController _tabController;

  @override
  void initState() {
    // 탭바를 사용하려면 initState 가 필요함.
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("나의 루틴"),
        bottom: PreferredSize(
            preferredSize: AppBar().preferredSize, child: _tabBar()),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          // 루틴 UI 부분
          RoutineView(),
          RoutineView(),
          RoutineView(),
          RoutineView(),
          RoutineView(),
          RoutineView(),
          RoutineView(),
        ],
      ),
    );
  }

  Widget _tabBar() {
    return TabBar(
      controller: _tabController,
      tabs: _tabs,
    );
  }
}
