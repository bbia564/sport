import 'package:get/get.dart';

import 'sport_other_logic.dart';

class SportOtherBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
