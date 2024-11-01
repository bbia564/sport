import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/main.dart';
import 'package:sports/pages/sport_first/current_page.dart';
import 'package:sports/pages/sport_first/history_page.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../router/sports_names.dart';
import 'sport_first_logic.dart';

class SportFirstPage extends StatefulWidget {
  const SportFirstPage({Key? key}) : super(key: key);

  @override
  State<SportFirstPage> createState() => _SportFirstPageState();
}

class _SportFirstPageState extends State<SportFirstPage>
    with SingleTickerProviderStateMixin {

  SportFirstLogic controller = Get.put(SportFirstLogic());
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: null,
        leading: Icon(
          Icons.add_circle,
          color: primaryColor,
          size: 40,
        ).marginOnly(left: 5).gestures(onTap: () {
          Get.toNamed(SportsNames.addPlant)?.then((_) {
            controller.getData();
          });
        }),
      ),
      body: Stack(
        children: [
          const SizedBox(width: double.infinity, height: double.infinity),
          Image.asset(
            'assets/bg.webp',
            width: double.infinity,
            height: 371,
            fit: BoxFit.cover,
          ),
          SafeArea(
              child: <Widget>[
                const SizedBox(
                  width: 230,
                  child: Text(
                    'Use sports to change your life',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ).marginSymmetric(horizontal: 15),
                const Text(
                  'Start your plan',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ).marginSymmetric(horizontal: 15),
                Container(
                  height: 100,
                  child: <Widget>[
                    Expanded(
                        child: <Widget>[
                          Obx(() {
                            return Text(
                              controller.sportNum.value.toString(),
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            );
                          }),
                          const Text(
                            'Number of movements',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ].toColumn(
                            mainAxisAlignment: MainAxisAlignment.center)),
                    Expanded(
                        child: <Widget>[
                          Obx(() {
                            return Text(
                              controller.expendNum.value.toString(),
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            );
                          }),
                          const Text(
                            'Calories burned (kcal)',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ].toColumn(mainAxisAlignment: MainAxisAlignment.center))
                  ].toRow(),
                )
                    .decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14))
                    .marginSymmetric(horizontal: 15, vertical: 10),
                Expanded(
                    child: Container(
                      child: <Widget>[SizedBox(
                        width: double.infinity,
                        child: Theme(
                          data: ThemeData(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              useMaterial3: true,
                              tabBarTheme:
                              TabBarTheme(
                                  indicatorColor: primaryColor)),
                          child: TabBar(
                            tabAlignment: TabAlignment.fill,
                            controller: _tabController,
                            dividerColor: Colors.transparent,
                            splashFactory: NoSplash.splashFactory,
                            labelPadding: EdgeInsets.zero,
                            labelStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            unselectedLabelStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),

                            tabs: const [
                              Tab(
                                text: "Current plan",
                              ),
                              Tab(
                                text: "History plan",
                              )
                            ],
                          ),
                        ),
                      ).marginOnly(bottom: 10),
                        Expanded(
                            child: Container(
                              width: double.infinity,
                              child: GetBuilder<SportFirstLogic>(builder: (_) {
                                return TabBarView(
                                  controller: _tabController,
                                  children: [
                                    CurrentPage(controller.currentList,refresh: (){
                                      controller.getData();
                                    },),
                                    HistoryPage(controller.historyList)
                                  ],
                                );
                              }),
                            ))
                      ].toColumn(),
                    ).decorated(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))))
              ].toColumn(crossAxisAlignment: CrossAxisAlignment.start))
        ],
      ),
    );
  }
}
