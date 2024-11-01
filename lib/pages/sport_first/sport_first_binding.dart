import 'package:get/get.dart';

import 'sport_first_logic.dart';

class SportFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SportFirstLogic());
  }
}
