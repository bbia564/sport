import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/pages/sport_first/sport_first_view.dart';
import 'package:sports/pages/sport_second/sport_second_view.dart';

import '../../main.dart';
import 'sport_tab_logic.dart';

class SportTabPage extends GetView<SportTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          SportFirstPage(),
          SportSecondPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navSportBars()),
    );
  }

  Widget _navSportBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled,color: Colors.grey.withOpacity(0.6)),
          activeIcon:Icon(Icons.home_filled,color: primaryColor),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings,color: Colors.grey.withOpacity(0.6)),
          activeIcon:Icon(Icons.settings,color: primaryColor),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
      },
    );
  }
}
