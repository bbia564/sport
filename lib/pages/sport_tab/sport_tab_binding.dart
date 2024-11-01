import 'package:get/get.dart';

import '../sport_first/sport_first_logic.dart';
import '../sport_second/sport_second_logic.dart';
import 'sport_tab_logic.dart';

class SportTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SportTabLogic());
    Get.lazyPut(() => SportFirstLogic());
    Get.lazyPut(() => SportSecondLogic());
  }
}
