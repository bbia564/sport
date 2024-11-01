import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sports/db_sports/db_sports.dart';

import '../../../db_sports/sport_entity.dart';

class AddPlantLogic extends GetxController {
  DBSports dbSports = Get.find<DBSports>();

  String title = '';
  var list = <ItemEntity>[
    ItemEntity(title: '', expendNum: '', content: '', isFinish: 0)
  ];

  void commit(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (title.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter a plan name');
      return;
    }
    for (final item in list) {
      if (item.title.isEmpty || item.expendNum.isEmpty || item.content.isEmpty) {
        Fluttertoast.showToast(msg: 'Please enter all the information');
        return;
      }
    }
    final entity = SportEntity(
      id: 0,
      createTime: DateTime.now(),
      title: title,
      list: list,
      finishTime: DateTime.now(),
    );
    await dbSports.insertSports(entity);
    Get.back();
  }
}
