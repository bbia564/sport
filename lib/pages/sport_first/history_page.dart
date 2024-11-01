import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../db_sports/sport_entity.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage(this.list, {Key? key}) : super(key: key);
  List<SportEntity> list;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return widget.list.isEmpty
        ? const Center(child: Text('No data',style: TextStyle(color: Colors.grey),))
        : ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: widget.list.length,
            itemBuilder: (_, index) {
              final entity = widget.list[index];
              return Container(
                padding: const EdgeInsets.all(20),
                child: <Widget>[
                  Text(
                    entity.title,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    entity.finishDateStr,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  )
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              )
                  .decorated(
                      color: const Color(0xfffafafa),
                      borderRadius: BorderRadius.circular(10))
                  .marginOnly(bottom: 10);
            });
  }

  @override
  bool get wantKeepAlive => true;
}
