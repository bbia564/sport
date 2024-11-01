import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/db_sports/db_sports.dart';
import 'package:sports/pages/sport_first/add_plant/add_plant_binding.dart';
import 'package:sports/pages/sport_first/add_plant/add_plant_view.dart';
import 'package:sports/pages/sport_first/sport_first_binding.dart';
import 'package:sports/pages/sport_first/sport_first_view.dart';
import 'package:sports/pages/sport_other/sport_other_binding.dart';
import 'package:sports/pages/sport_other/sport_other_view.dart';
import 'package:sports/pages/sport_second/feedback/feedback_back.dart';
import 'package:sports/pages/sport_second/feedback/feedback_binding.dart';
import 'package:sports/pages/sport_second/feedback/feedback_view.dart';
import 'package:sports/pages/sport_second/sport_second_binding.dart';
import 'package:sports/pages/sport_second/sport_second_view.dart';
import 'package:sports/pages/sport_tab/sport_tab_binding.dart';
import 'package:sports/pages/sport_tab/sport_tab_view.dart';

Color primaryColor = const Color(0xff7fe514);
Color bgColor = const Color(0xfff2f2f2);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBSports().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Beis,
      initialRoute:'/sport',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Beis = [
  GetPage(name: '/sport', page: () => const SportOtherView(), binding: SportOtherBinding()),
  GetPage(name: '/sport_tab', page: () => SportTabPage(), binding: SportTabBinding()),
  GetPage(name: '/sport_other', page: () => const FeedbackBack()),
  GetPage(name: '/sport_first', page: () => const SportFirstPage(), binding: SportFirstBinding()),
  GetPage(name: '/sport_second', page: () => SportSecondPage(), binding: SportSecondBinding()),
  GetPage(name: '/feedback', page: () => FeedbackPage(), binding: FeedbackBinding()),
  GetPage(name: '/add_plant', page: () => AddPlantPage(), binding: AddPlantBinding())
];
