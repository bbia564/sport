import 'package:get/get.dart';

import 'add_plant_logic.dart';

class AddPlantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddPlantLogic());
  }
}
