import 'package:flutter/material.dart';

enum Faction { folkTails, ironTeeth }

class Calculator extends ChangeNotifier {
  Faction _faction = Faction.folkTails;
  int _population = 0;
  int _workingHours = 16;

  Faction get faction => _faction;

  void setFaction(Faction faction) {
    _faction = faction;
    notifyListeners();
  }

  void setPopulation(int value) {
    _population = value;
    notifyListeners();
  }

  void setWorkingHours(int value) {
    _workingHours = value;
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

  double get nrOfWaterPumps => (waterConsumption / _workingHours / 3);

  // ###########################################################################
  // FOLKTAILS
  // ###########################################################################

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

  double get nrOfLargeWaterPumps => (waterConsumption / _workingHours / 15);

  int get nrOfSelectedFoodItems =>
      selectedFoodItems.values.where((value) => value == true).length;

  int get nrCarrotTiles => calculateNrOfTilesFolktails(
    isSelected: selectedFoodItems['isCarrotChecked']!,
    yield: 3,
    days: 4,
    isBeehiveBuffApplied: beehiveBuffApplied['isCarrotChecked']!,
  );

  int get nrSunflowerTiles => calculateNrOfTilesFolktails(
    isSelected: selectedFoodItems['isSunFlowerSeedChecked']!,
    yield: 2,
    days: 5,
    isBeehiveBuffApplied: beehiveBuffApplied['isSunFlowerSeedChecked']!,
  );

  int get nrPotatoTiles => calculateNrOfTilesFolktails(
    isSelected: selectedFoodItems['isGrilledPotatoChecked']!,
    yield: 4,
    days: 6,
    isBeehiveBuffApplied: beehiveBuffApplied['isGrilledPotatoChecked']!,
  );

  int get nrWheatTilesForBread => calculateNrOfTilesFolktails(
      isSelected: selectedFoodItems['isBreadChecked']!,
      yield: 15,
      days: 10,
      isBeehiveBuffApplied: beehiveBuffApplied['isWheatForBreadChecked']!,
  );

  // Chestnut trees can not be buffed by beehives
  int get nrChestnutTiles => calculateNrOfTilesFolktails(
    isSelected: selectedFoodItems['isGrilledChestnutChecked']!,
    yield: 3,
    days: 4,
    isBeehiveBuffApplied: false,
  );

  int get nrCattailTiles => calculateNrOfTilesFolktails(
    isSelected: selectedFoodItems['isCattailCrackerChecked']!,
    yield: 12,
    days: 8,
    isBeehiveBuffApplied: beehiveBuffApplied['isCattailCrackerChecked']!,
  );

  int get nrSpadderdockTiles => calculateNrOfTilesFolktails(
    isSelected: selectedFoodItems['isGrilledSpadderdockChecked']!,
    yield: 9,
    days: 12,
    isBeehiveBuffApplied: beehiveBuffApplied['isGrilledSpadderdockChecked']!,
  );

  int get nrWheatTilesForPastry => calculateNrOfTilesFolktails(
    isSelected: selectedFoodItems['isPastryChecked']!,
    yield: 9,
    days: 10,
    isBeehiveBuffApplied: beehiveBuffApplied['isWheatForPastryChecked']!,
  );

  // Maple trees can not be buffed by beehives
  int get nrMapleTilesForPastry => calculateNrOfTilesFolktails(
    isSelected: selectedFoodItems['isPastryChecked']!,
    yield: 3,
    days: 4,
    isBeehiveBuffApplied: false,
  );

  int calculateNrOfTilesFolktails({
    required bool isSelected,
    required int yield,
    required int days,
    required bool isBeehiveBuffApplied,
  }) {
    if (!isSelected) {
      return 0;
    } else {
      return (foodConsumption /
              yield *
              days *
              (isBeehiveBuffApplied ? 0.75 : 1) /
              nrOfSelectedFoodItems)
          .ceil();
    }
  }

  // ###########################################################################
  // IRONTEETH
  // ###########################################################################

  Map<String, bool> selectedFoodItemsIronteeth = {
    'isKohlrabiSelected': false,
    'isFermentedCassavaSelected': false,
    'isFermentedSoybeanSelected': false,
    'isCornRationSelected': false,
    'isEggplantRationSelected': false,
    'isMangroveFruitSelected': false,
    'isAlgaeRationSelected': false,
    'isFermentedMushroomSelected': false,
    'isCoffeeSelected': false,
  };

  int get nrOfSelectedFoodItemsIronteeth =>
      selectedFoodItemsIronteeth.values.where((value) => value == true).length;

  void selectFoodItemIronteeth(String key, bool value) {
    selectedFoodItemsIronteeth[key] = value;
    notifyListeners();
  }

  int get nrKohlrabiTiles => calculateNrOfTilesIronteeth(
    isSelected: selectedFoodItemsIronteeth['isKohlrabiSelected']!,
    yield: 2,
    days: 3,
  );

  int get nrCassavaTiles => calculateNrOfTilesIronteeth(
    isSelected: selectedFoodItemsIronteeth['isFermentedCassavaSelected']!,
    yield: 2.5,
    days: 5,
  );

  int get nrSoybeanTiles => calculateNrOfTilesIronteeth(
    isSelected: selectedFoodItemsIronteeth['isFermentedSoybeanSelected']!,
    yield: 6.67,
    days: 8,
  );

  int get nrMushroomHydroponicGardens => calculateNrOfTilesIronteeth(
    isSelected: selectedFoodItemsIronteeth['isFermentedMushroomSelected']!,
    yield: 180,
    days: 8,
  );

  int get nrCanolaTilesForFermentedSoybeans => calculateNrOfTilesIronteeth(
    isSelected: selectedFoodItemsIronteeth['isFermentedSoybeanSelected']!,
    yield: 60,
    days: 9,
  );

  int get nrCornTiles => calculateNrOfTilesIronteeth(
    isSelected: selectedFoodItemsIronteeth['isCornRationSelected']!,
    yield: 10,
    days: 10,
  );

  int get nrEggplantTiles => calculateNrOfTilesIronteeth(
    isSelected: selectedFoodItemsIronteeth['isEggplantRationSelected']!,
    yield: 18,
    days: 12,
  );

  int get nrCanolaTilesForEggplantRations => calculateNrOfTilesIronteeth(
    isSelected: selectedFoodItemsIronteeth['isEggplantRationSelected']!,
    yield: 18,
    days: 9,
  );

  int get nrMangroveTiles => calculateNrOfTilesIronteeth(
    isSelected: selectedFoodItemsIronteeth['isMangroveFruitSelected']!,
    yield: 4,
    days: 10,
  );

  int get nrAlgaeHydroponicGardens => calculateNrOfTilesIronteeth(
    isSelected: selectedFoodItemsIronteeth['isAlgaeRationSelected']!,
    yield: 420,
    days: 12,
  );

  int get nrCanolaTilesForAlgaeRations => calculateNrOfTilesIronteeth(
    isSelected: selectedFoodItemsIronteeth['isAlgaeRationSelected']!,
    yield: 18,
    days: 9,
  );

  int calculateNrOfTilesIronteeth({
    required bool isSelected,
    required double yield,
    required int days,
  }) {
    if (!isSelected) {
      return 0;
    } else {
      return (foodConsumption /
          yield *
          days /
          nrOfSelectedFoodItemsIronteeth)
          .ceil();
    }
  }
}
