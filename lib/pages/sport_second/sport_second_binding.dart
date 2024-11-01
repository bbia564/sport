import 'package:get/get.dart';

import 'sport_second_logic.dart';

class SportSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SportSecondLogic());
  }
}
