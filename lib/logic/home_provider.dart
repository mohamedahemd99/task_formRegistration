

import 'package:flutter/material.dart';


import 'package:your_app_name/model/grid_model.dart';
import 'package:your_app_name/presentation/resources/assets_manager.dart';

class HomeProvider extends ChangeNotifier {
  List<GridIcon> grid = [
    GridIcon(title: "Dashboard", image: ImageAssets.counter),
    GridIcon(title: "Clinical & NonClinical Risks", image: ImageAssets.shield),
    GridIcon(title: "OVR", image: ImageAssets.deleteShield),
    GridIcon(title: "Staff Risk", image: ImageAssets.twoPerson),
    GridIcon(title: "PCRA ICRA", image: ImageAssets.hummerWithPerson),
    GridIcon(title: "Kpis", image: ImageAssets.barChart),
  ];
}
