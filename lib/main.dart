import 'package:flutter/material.dart';
import 'package:hatin/src/repository/routin_repository.dart';
import 'package:hatin/src/service/routin_service.dart';
import 'package:hatin/src/ui/app/app_view_model.dart';
import 'package:hatin/src/ui/my_page/my_page.dart';
import 'package:hatin/src/ui/onboard/onboard_view.dart';
import 'package:hatin/src/ui/routine/routin_add_page.dart';
import 'package:hatin/src/ui/routine/routin_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppViewModel()),
        ChangeNotifierProvider(
            create: (context) => RoutinViewModel(
                routinService:
                    RoutinService(routinRepository: RoutinRepository())))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: false,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            colorScheme: const ColorScheme.light(
                primary: Color(0xffFE4F28), secondary: Color(0x00f1f3f5)),
            scaffoldBackgroundColor: const Color(0xffefefef),
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                titleTextStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff111111))),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                unselectedItemColor: Color(0xffd9d9d9),
                selectedItemColor: Color(0xffFE4F28))),
        routes: {
          "/": (context) => const OnboardView(),
          "/onboard": (context) => const OnboardView(),
          "/routinAddPage": (context) => const RoutinAddPage(),
          "/myPage": (context) => const MyPage(),
        },
        initialRoute: "/",
      ),
    );
  }
}
