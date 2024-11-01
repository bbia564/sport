import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'sport_second_logic.dart';

class SportSecondPage extends GetView<SportSecondLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = [
      'Clean all records',
      'Feedback',
      'About app'
    ];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      child: <Widget>[
        Text(
          titles[index],
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: Colors.grey,
        )
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    )
        .decorated(color: Colors.white, borderRadius: BorderRadius.circular(10))
        .marginOnly(bottom: 10)
        .gestures(onTap: () {
      switch (index) {
        case 0:
          controller.cleanSportData();
          break;
        case 1:
          Get.toNamed('/feedback');
          break;
        case 2:
          controller.aboutSportApp(context);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            _item(0, context),
            _item(1, context),
            _item(2, context),
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
