import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/db_sports/db_sports.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../db_sports/sport_entity.dart';

class CurrentPage extends StatefulWidget {
  CurrentPage(this.list, {this.refresh, Key? key}) : super(key: key);
  List<SportEntity> list;
  final VoidCallback? refresh;

  @override
  State<CurrentPage> createState() => _CurrentPageState();
}

class _CurrentPageState extends State<CurrentPage>
    with AutomaticKeepAliveClientMixin {
  DBSports dbSports = Get.find<DBSports>();

  @override
  Widget build(BuildContext context) {
    return widget.list.isEmpty
        ? const Center(
            child: SizedBox(
            width: 240,
            child: Text(
              'Click the plus sign in the top left corner to add a plan',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ))
        : ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: widget.list.length,
            itemBuilder: (_, index) {
              var entity = widget.list[index];
              return Container(
                child: <Widget>[
                  Text(
                    entity.title,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: entity.list.length,
                      itemBuilder: (_, index) {
                        var item = entity.list[index];
                        return Container(
                          padding: const EdgeInsets.all(12),
                          child: <Widget>[
                            <Widget>[
                              Image.asset(
                                'assets/circle.webp',
                                width: 13,
                                height: 13,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Text(
                                item.title,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ))
                            ].toRow(),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              item.content,
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            <Widget>[
                              Expanded(
                                  child: <Widget>[
                                const Text(
                                  'Cost: ',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                Expanded(
                                    child: Text(
                                  (int.tryParse(item.expendNum) ?? 0)
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ))
                              ].toRow()),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                alignment: Alignment.center,
                                child: Text(
                                  item.isFinish == 0
                                      ? 'Uncompleted'
                                      : 'Completed',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )
                                  .decorated(
                                      color: item.isFinish == 0
                                          ? const Color(0xffffa150)
                                          : const Color(0xffcccccc),
                                      borderRadius: BorderRadius.circular(8))
                                  .gestures(onTap: () async {
                                if (item.isFinish == 1) {
                                  return;
                                }
                                final currentItem = ItemEntity(
                                    title: item.title,
                                    expendNum: item.expendNum,
                                    content: item.content,
                                    isFinish: 1);
                                entity.list[index] = currentItem;
                                entity.finishTime = DateTime.now();
                                await dbSports.updateSports(entity);
                                widget.refresh?.call();
                              })
                            ].toRow()
                          ].toColumn(
                              crossAxisAlignment: CrossAxisAlignment.start),
                        )
                            .decorated(
                                color: const Color(0xfffafafa),
                                borderRadius: BorderRadius.circular(10))
                            .marginOnly(bottom: 10);
                      })
                ].toColumn(),
              );
            });
  }

  @override
  bool get wantKeepAlive => true;
}
