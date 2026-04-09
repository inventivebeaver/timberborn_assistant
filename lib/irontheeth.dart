import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calculator.dart';

class Irontheeth extends StatelessWidget {
  const Irontheeth({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text('Daily Consumption'),
            DataTable(
              columns: [
                DataColumn(label: Text('Food')),
                DataColumn(label: Text('Water')),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        Provider.of<Calculator>(
                          context,
                        ).foodConsumption.toString(),
                      ),
                    ),
                    DataCell(
                      Text(
                        Provider.of<Calculator>(
                          context,
                        ).waterConsumption.toString(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 64),
            Text('Water production'),
            DataTable(
              columns: [
                DataColumn(label: Text('Building')),
                DataColumn(label: Text('Number')),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(Text('Deep Water pump')),
                    DataCell(
                      Text(
                        Provider.of<Calculator>(
                          context,
                        ).nrOfWaterPumps.toString(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(width: 128),
        Column(
          children: [
            Text('Food production'),
            DataTable(
              columns: <DataColumn>[
                DataColumn(label: Text('Selected')),
                DataColumn(label: Text('Food Item')),
                DataColumn(label: Text('Tiles')),
                DataColumn(label: Text('Hydroponic Garden')),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: [
                    DataCell(
                      Checkbox(
                        value: Provider.of<Calculator>(
                          context,
                        ).selectedFoodItemsIronteeth['isKohlrabiSelected'],
                        onChanged: (value) {
                          Provider.of<Calculator>(
                            context,
                            listen: false,
                          ).selectFoodItemIronteeth(
                            'isKohlrabiSelected',
                            value!,
                          );
                        },
                      ),
                    ),
                    DataCell(Text('Kohlrabi')),
                    DataCell(
                      Text(
                        Provider.of<Calculator>(
                          context,
                        ).nrKohlrabiTiles.toString(),
                      ),
                    ),
                    DataCell(Text('')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Checkbox(
                        value: Provider.of<Calculator>(
                          context,
                        ).selectedFoodItemsIronteeth['isMangroveFruitSelected'],
                        onChanged: (value) {
                          Provider.of<Calculator>(
                            context,
                            listen: false,
                          ).selectFoodItemIronteeth(
                            'isMangroveFruitSelected',
                            value!,
                          );
                        },
                      ),
                    ),
                    DataCell(Text('Mangrove Fruit')),
                    DataCell(
                      Text(
                        Provider.of<Calculator>(
                          context,
                        ).nrMangroveTiles.toString(),
                      ),
                    ),
                    DataCell(Text('')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Checkbox(
                        value: Provider.of<Calculator>(
                          context,
                        ).selectedFoodItemsIronteeth['isFermentedCassavaSelected'],
                        onChanged: (value) {
                          Provider.of<Calculator>(
                            context,
                            listen: false,
                          ).selectFoodItemIronteeth(
                            'isFermentedCassavaSelected',
                            value!,
                          );
                        },
                      ),
                    ),
                    DataCell(Text('Fermented Cassava')),
                    DataCell(
                      Text(
                        Provider.of<Calculator>(
                          context,
                        ).nrCassavaTiles.toString(),
                      ),
                    ),
                    DataCell(Text('')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Checkbox(
                        value: Provider.of<Calculator>(
                          context,
                        ).selectedFoodItemsIronteeth['isFermentedSoybeanSelected'],
                        onChanged: (value) {
                          Provider.of<Calculator>(
                            context,
                            listen: false,
                          ).selectFoodItemIronteeth(
                            'isFermentedSoybeanSelected',
                            value!,
                          );
                        },
                      ),
                    ),
                    DataCell(Text('Fermented Soybean')),
                    DataCell(
                      Text(
                        Provider.of<Calculator>(
                          context,
                        ).nrSoybeanTiles.toString(),
                      ),
                    ),
                    DataCell(Text('')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('')),
                    DataCell(Text('Canola Oil')),
                    DataCell(
                      Text(
                        Provider.of<Calculator>(
                          context,
                        ).nrCanolaTilesForFermentedSoybeans.toString(),
                      ),
                    ),
                    DataCell(Text('')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Checkbox(
                        value: Provider.of<Calculator>(
                          context,
                        ).selectedFoodItemsIronteeth['isFermentedMushroomSelected'],
                        onChanged: (value) {
                          Provider.of<Calculator>(
                            context,
                            listen: false,
                          ).selectFoodItemIronteeth(
                            'isFermentedMushroomSelected',
                            value!,
                          );
                        },
                      ),
                    ),
                    DataCell(Text('Fermented Mushroom')),
                    DataCell(Text('')),
                    DataCell(
                      Text(
                        Provider.of<Calculator>(
                          context,
                        ).nrMushroomHydroponicGardens.toString(),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Checkbox(
                        value: Provider.of<Calculator>(
                          context,
                        ).selectedFoodItemsIronteeth['isCornRationSelected'],
                        onChanged: (value) {
                          Provider.of<Calculator>(
                            context,
                            listen: false,
                          ).selectFoodItemIronteeth(
                            'isCornRationSelected',
                            value!,
                          );
                        },
                      ),
                    ),
                    DataCell(Text('Corn Ration')),
                    DataCell(
                      Text(
                        Provider.of<Calculator>(context).nrCornTiles.toString(),
                      ),
                    ),
                    DataCell(Text('')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Checkbox(
                        value: Provider.of<Calculator>(
                          context,
                        ).selectedFoodItemsIronteeth['isEggplantRationSelected'],
                        onChanged: (value) {
                          Provider.of<Calculator>(
                            context,
                            listen: false,
                          ).selectFoodItemIronteeth(
                            'isEggplantRationSelected',
                            value!,
                          );
                        },
                      ),
                    ),
                    DataCell(Text('Eggplant Ration')),
                    DataCell(
                      Text(
                        Provider.of<Calculator>(
                          context,
                        ).nrEggplantTiles.toString(),
                      ),
                    ),
                    DataCell(Text('')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('')),
                    DataCell(Text('Canola Oil')),
                    DataCell(
                      Text(
                        Provider.of<Calculator>(
                          context,
                        ).nrCanolaTilesForEggplantRations.toString(),
                      ),
                    ),
                    DataCell(Text('')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Checkbox(
                        value: Provider.of<Calculator>(
                          context,
                        ).selectedFoodItemsIronteeth['isAlgaeRationSelected'],
                        onChanged: (value) {
                          Provider.of<Calculator>(
                            context,
                            listen: false,
                          ).selectFoodItemIronteeth(
                            'isAlgaeRationSelected',
                            value!,
                          );
                        },
                      ),
                    ),
                    DataCell(Text('Algae Ration')),
                    DataCell(Text('')),
                    DataCell(
                      Text(
                        Provider.of<Calculator>(
                          context,
                        ).nrAlgaeHydroponicGardens.toString(),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('')),
                    DataCell(Text('Canola Oil')),
                    DataCell(
                      Text(
                        Provider.of<Calculator>(
                          context,
                        ).nrCanolaTilesForAlgaeRations.toString(),
                      ),
                    ),
                    DataCell(Text('')),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
