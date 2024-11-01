
import 'package:get/get.dart';
import 'package:sports/pages/sport_first/add_plant/add_plant_binding.dart';
import 'package:sports/pages/sport_first/add_plant/add_plant_view.dart';
import 'package:sports/pages/sport_first/sport_first_binding.dart';
import 'package:sports/pages/sport_second/feedback/feedback_binding.dart';
import 'package:sports/pages/sport_second/feedback/feedback_view.dart';
import 'package:sports/pages/sport_tab/sport_tab_view.dart';
import 'package:sports/router/sports_names.dart';

import '../pages/sport_first/sport_first_view.dart';
import '../pages/sport_second/sport_second_binding.dart';
import '../pages/sport_second/sport_second_view.dart';
import '../pages/sport_tab/sport_tab_binding.dart';

class SportPages {

  static pageBuilder({
    required String name,
    required GetPageBuilder page,
    Bindings? binding,
  }) {
    return GetPage(
      name: name,
      page: page,
      binding: binding,
      preventDuplicates: true,
      transition: Transition.cupertino,
      popGesture: true,
    );
  }

  static List<GetPage> list = [
    pageBuilder(name: SportsNames.sportTab, page: () => SportTabPage(), binding: SportTabBinding()),
    pageBuilder(name: SportsNames.sportFirst, page: () => const SportFirstPage(), binding: SportFirstBinding()),
    pageBuilder(name: SportsNames.sportSecond, page: () => SportSecondPage(), binding: SportSecondBinding()),
    pageBuilder(name: SportsNames.feedback, page: () => FeedbackPage(), binding: FeedbackBinding()),
    pageBuilder(name: SportsNames.addPlant, page: () => AddPlantPage(), binding: AddPlantBinding())
  ];
}