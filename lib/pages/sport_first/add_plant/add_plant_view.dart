import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/main.dart';
import 'package:sports/pages/sport_first/sport_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../db_sports/sport_entity.dart';
import 'add_plant_logic.dart';

class AddPlantPage extends GetView<AddPlantLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add plan'),
        backgroundColor: Colors.white,
        actions: [
          const Text(
            'Commit',
            style: TextStyle(color: Color(0xffffa150), fontSize: 14),
          ).marginOnly(right: 20).gestures(onTap: () {
            controller.commit(context);
          })
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                Container(
                  padding: const EdgeInsets.all(15),
                  child: <Widget>[
                    const Text(
                      'Plan name',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 44,
                      child: SportTextField(
                          value: controller.title,
                          maxLength: 15,
                          onChange: (value) {
                            controller.title = value;
                          }),
                    ).decorated(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300))
                  ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    padding: const EdgeInsets.all(15),
                    child: GetBuilder<AddPlantLogic>(builder: (_) {
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: controller.list.length + 1,
                          itemBuilder: (_, index) {
                            if (index < controller.list.length) {
                              var item = controller.list[index];
                              return <Widget>[
                                <Widget>[
                                  Text(
                                    'Details${index + 1}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Visibility(
                                      visible: index > 0,
                                      child: Image.asset(
                                        'assets/cha.webp',
                                        width: 13,
                                        height: 13,
                                        fit: BoxFit.cover,
                                      ).gestures(onTap: () {
                                        var currentList = controller.list;
                                        currentList.removeAt(index);
                                        controller.list = currentList;
                                        controller.update();
                                      }))
                                ].toRow(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 44,
                                  child: SportTextField(
                                      hintText: 'Title',
                                      value: item.title,
                                      maxLength: 15,
                                      onChange: (value) {
                                        item.title = value;
                                      }),
                                ).decorated(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.grey.shade300)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 44,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5),
                                  child: <Widget>[
                                    Expanded(
                                      child: SportTextField(
                                          hintText: 'Projected consumption',
                                          value: item.expendNum,
                                          isInteger: true,
                                          maxLength: 8,
                                          onChange: (value) {
                                            item.expendNum = value;
                                          }),
                                    ),
                                    const Text(
                                      '(kcal)',
                                      style: TextStyle(fontSize: 14),
                                    )
                                  ].toRow(),
                                ).decorated(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.grey.shade300)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: SportTextField(
                                      padding: const EdgeInsets.all(10),
                                      hintText: 'Content',
                                      value: item.content,
                                      maxLines: 6,
                                      maxLength: 200,
                                      onChange: (value) {
                                        item.content = value;
                                      }),
                                ).decorated(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.grey.shade300))
                              ]
                                  .toColumn(
                                  crossAxisAlignment: CrossAxisAlignment.start)
                                  .marginOnly(bottom: 10);
                            }
                            return Container(
                              height: 44,
                              child: <Widget>[
                                const Icon(
                                  Icons.add_box,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Add Details',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ].toRow(
                                  mainAxisAlignment: MainAxisAlignment.center),
                            )
                                .decorated(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10))
                                .gestures(onTap: () {
                              var currentList = controller.list;
                              currentList.add(ItemEntity(
                                  title: '',
                                  expendNum: '',
                                  content: '',
                                  isFinish: 0));
                              controller.list = currentList;
                              controller.update();
                            });
                          });
                    })

                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10))
              ].toColumn(),
            ).marginAll(15)),
      ),
    );
  }
}
