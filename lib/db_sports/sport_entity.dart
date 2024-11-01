import 'dart:convert';

import 'package:intl/intl.dart';

class SportEntity {
  int id;
  DateTime createTime;
  String title;
  List<ItemEntity> list;
  DateTime finishTime;

  SportEntity({
    required this.id,
    required this.createTime,
    required this.title,
    required this.list,
    required this.finishTime,
  });

  factory SportEntity.fromJson(Map<String, dynamic> json) => SportEntity(
    id: json["id"],
    createTime: DateTime.parse(json["createTime"]),
    title: json["title"],
    list: (jsonDecode(json["list"]) as List).map((e) => ItemEntity.fromJson(e)).toList(),
    finishTime: DateTime.parse(json["finishTime"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createTime": createTime.toIso8601String(),
    "title": title,
    "list": jsonEncode(list.map((e) => e.toJson()).toList()),
    "finishTime": finishTime.toIso8601String(),
  };

  bool get isFinish {
    return list.every((element) => element.isFinish == 1);
  }

  String get finishDateStr {
    return  'Completion Date: ${DateFormat('yyyy/MM/dd').format(finishTime)}';
  }

}

class ItemEntity {
  String title;
  String expendNum;
  String content;
  int isFinish;

  ItemEntity({
    required this.title,
    required this.expendNum,
    required this.content,
    required this.isFinish,
  });

  factory ItemEntity.fromJson(Map<String, dynamic> json) => ItemEntity(
    title: json["title"],
    expendNum: json["expendNum"],
    content: json["content"],
    isFinish: json["isFinish"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "expendNum": expendNum,
    "content": content,
    "isFinish": isFinish,
  };
}