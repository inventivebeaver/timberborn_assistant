import 'package:flutter/material.dart';

class Calculator extends ChangeNotifier {
  int _population = 0;

  Map<String, bool> checkedFoodItems = {
    'isCarrotChecked': false,
    'isSunFlowerSeedChecked': false,
    'isGrilledPotatoChecked': false,
    'isBreadChecked': false,
    'isGrilledChestnutChecked': false,
    'isCattailCrackerChecked': false,
    'isGrilledSpadderdockChecked': false,
    'isPastryChecked': false,
  };

  void setPopulation(int value) {
    _population = value;
    notifyListeners();
  }

  void selectFoodItem(String key, bool value) {
    checkedFoodItems[key] = value;
    notifyListeners();
  }

  double get foodConsumption => (_population * 2.67);

  double get waterConsumption => (_population * 2.13);

  int get nrOfSelectedFoodItems =>
      checkedFoodItems.values.where((value) => value == true).length;

  double get nrCarrotTiles => checkedFoodItems['isCarrotChecked']!
      ? (foodConsumption / 0.75 / nrOfSelectedFoodItems)
      : 0;

  double get nrSunflowerTiles => checkedFoodItems['isSunFlowerSeedChecked']!
      ? (foodConsumption / 0.4 / nrOfSelectedFoodItems)
      : 0;

  double get nrPotatoTiles => checkedFoodItems['isGrilledPotatoChecked']!
      ? (foodConsumption / 0.67 / nrOfSelectedFoodItems)
      : 0;

  double get nrWheatTilesForBread => checkedFoodItems['isBreadChecked']!
      ?
  (foodConsumption / 1.5 / nrOfSelectedFoodItems) : 0;

  double get nrChestnutTiles => checkedFoodItems['isGrilledChestnutChecked']!
      ?
  (foodConsumption / 0.75 / nrOfSelectedFoodItems) : 0;

  double get nrCattailTiles => checkedFoodItems['isCattailCrackerChecked']!
      ? (foodConsumption / 1.5 / nrOfSelectedFoodItems) : 0;

  double get nrSpadderdockTiles => checkedFoodItems['isGrilledSpadderdockChecked']!
      ?
  (foodConsumption / 0.75 / nrOfSelectedFoodItems) : 0;

  double get nrWheatTilesForPastry => checkedFoodItems['isPastryChecked']!
      ?
      (foodConsumption / 0.9 / nrOfSelectedFoodItems) : 0;

  double get nrMapleTilesForPastry => checkedFoodItems['isPastryChecked']!
      ?
      (foodConsumption / 0.75 / nrOfSelectedFoodItems) : 0;
}
