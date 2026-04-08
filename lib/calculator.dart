import 'package:flutter/material.dart';

class Calculator extends ChangeNotifier {
  int _population = 0;

  Map<String, bool> selectedFoodItems = {
    'isCarrotChecked': false,
    'isSunFlowerSeedChecked': false,
    'isGrilledPotatoChecked': false,
    'isBreadChecked': false,
    'isGrilledChestnutChecked': false,
    'isCattailCrackerChecked': false,
    'isGrilledSpadderdockChecked': false,
    'isPastryChecked': false,
  };

  Map<String, bool> beehiveBuffApplied = {
    'isCarrotChecked': false,
    'isSunFlowerSeedChecked': false,
    'isGrilledPotatoChecked': false,
    'isWheatForBreadChecked': false,
    'isCattailCrackerChecked': false,
    'isGrilledSpadderdockChecked': false,
    'isWheatForPastryChecked': false,
  };

  void setPopulation(int value) {
    _population = value;
    notifyListeners();
  }

  void selectFoodItem(String key, bool value) {
    selectedFoodItems[key] = value;
    notifyListeners();
  }

  void applyBeehiveBuff(String key, bool value) {
    beehiveBuffApplied[key] = value;
    notifyListeners();
  }

  double get foodConsumption => (_population * 2.67);

  double get waterConsumption => (_population * 2.13);

  int get nrOfSelectedFoodItems =>
      selectedFoodItems.values.where((value) => value == true).length;

  double get nrCarrotTiles => selectedFoodItems['isCarrotChecked']!
      ? (foodConsumption /
            3 *
            4 *
            (beehiveBuffApplied['isCarrotChecked']! ? 0.75 : 1) /
            nrOfSelectedFoodItems)
      : 0;

  double get nrSunflowerTiles => selectedFoodItems['isSunFlowerSeedChecked']!
      ? (foodConsumption /
            2 *
            5 *
            (beehiveBuffApplied['isSunFlowerSeedChecked']! ? 0.75 : 1) /
            nrOfSelectedFoodItems)
      : 0;

  double get nrPotatoTiles => selectedFoodItems['isGrilledPotatoChecked']!
      ? (foodConsumption /
            1 *
            1.5 *
            (beehiveBuffApplied['isGrilledPotatoChecked']! ? 0.75 : 1) /
            nrOfSelectedFoodItems)
      : 0;

  double get nrWheatTilesForBread => selectedFoodItems['isBreadChecked']!
      ? (foodConsumption /
            15 *
            10 *
            (beehiveBuffApplied['isWheatForBreadChecked']! ? 0.75 : 1) /
            nrOfSelectedFoodItems)
      : 0;

  double get nrChestnutTiles => selectedFoodItems['isGrilledChestnutChecked']!
      ? (foodConsumption / 0.75 / nrOfSelectedFoodItems)
      : 0;

  double get nrCattailTiles => selectedFoodItems['isCattailCrackerChecked']!
      ? (foodConsumption /
            12 *
            8 *
            (beehiveBuffApplied['isCattailCrackerChecked']! ? 0.75 : 1) /
            nrOfSelectedFoodItems)
      : 0;

  double get nrSpadderdockTiles =>
      selectedFoodItems['isGrilledSpadderdockChecked']!
      ? (foodConsumption /
            9 *
            12 *
            (beehiveBuffApplied['isGrilledSpadderdockChecked']! ? 0.75 : 1) /
            nrOfSelectedFoodItems)
      : 0;

  double get nrWheatTilesForPastry => selectedFoodItems['isPastryChecked']!
      ? (foodConsumption /
            9 *
            10 *
            (beehiveBuffApplied['isWheatForPastryChecked']! ? 0.75 : 1) /
            nrOfSelectedFoodItems)
      : 0;

  double get nrMapleTilesForPastry => selectedFoodItems['isPastryChecked']!
      ? (foodConsumption / 0.75 / nrOfSelectedFoodItems)
      : 0;
}
