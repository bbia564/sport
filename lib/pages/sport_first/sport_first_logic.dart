import 'package:get/get.dart';
import 'package:sports/db_sports/db_sports.dart';

import '../../db_sports/sport_entity.dart';

class SportFirstLogic extends GetxController {
  DBSports dbSports = Get.find<DBSports>();

  var sportNum = 0.obs;
  var expendNum = 0.obs;
  var currentList = <SportEntity>[];
  var historyList = <SportEntity>[];

  void getData() async {
    final result = await dbSports.getSportsAllData();
    sportNum.value = result.length;
    expendNum.value = result.fold(
        0,
        (previousValue, element) =>
            previousValue +
            element.list.fold(
                0,
                (previousValue, element) =>
                    previousValue + int.parse(element.expendNum)));
    currentList = result.where((element) => !element.isFinish).toList();
    historyList = result.where((element) => element.isFinish).toList();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
