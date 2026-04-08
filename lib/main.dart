import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:timberborn_assistant/calculator.dart';

void main() {
  runApp(const TimberbornAssistant());
}

class TimberbornAssistant extends StatelessWidget {
  const TimberbornAssistant({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Calculator(),
      child: MaterialApp(title: 'Timberborn Assistant', home: const HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Timberborn Assistant')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropdownMenu(
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: 'folktails', label: 'Folktails'),
                ],
                initialSelection: 'folktails',
                label: Text('Faction'),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Population',
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          Provider.of<Calculator>(
                            context,
                            listen: false,
                          ).setPopulation(int.parse(value));
                        } else {
                          Provider.of<Calculator>(
                            context,
                            listen: false,
                          ).setPopulation(0);
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
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
              SizedBox(height: 32),
              DataTable(
                columns: <DataColumn>[
                  DataColumn(label: Text('Selected')),
                  DataColumn(label: Text('Beehive')),
                  DataColumn(label: Text('Food Item')),
                  DataColumn(label: Text('Tiles')),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Checkbox(
                          value: Provider.of<Calculator>(
                            context,
                          ).selectedFoodItems['isCarrotChecked'],
                          onChanged: (value) {
                            Provider.of<Calculator>(
                              context,
                              listen: false,
                            ).selectFoodItem('isCarrotChecked', value!);
                          },
                        ),
                      ),
                      DataCell(
                        Checkbox(
                          value: Provider.of<Calculator>(
                            context,
                          ).beehiveBuffApplied['isCarrotChecked'],
                          onChanged: (value) {
                            Provider.of<Calculator>(
                              context,
                              listen: false,
                            ).applyBeehiveBuff('isCarrotChecked', value!);
                          },
                        ),
                      ),
                      DataCell(Text('Carrot')),
                      DataCell(
                        Text(
                          Provider.of<Calculator>(
                            context,
                          ).nrCarrotTiles.toString(),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Checkbox(
                          value: Provider.of<Calculator>(
                            context,
                          ).selectedFoodItems['isSunFlowerSeedChecked'],
                          onChanged: (value) {
                            Provider.of<Calculator>(
                              context,
                              listen: false,
                            ).selectFoodItem('isSunFlowerSeedChecked', value!);
                          },
                        ),
                      ),
                      DataCell(
                        Checkbox(
                          value: Provider.of<Calculator>(
                            context,
                          ).beehiveBuffApplied['isSunFlowerSeedChecked'],
                          onChanged: (value) {
                            Provider.of<Calculator>(
                              context,
                              listen: false,
                            ).applyBeehiveBuff(
                              'isSunFlowerSeedChecked',
                              value!,
                            );
                          },
                        ),
                      ),
                      DataCell(Text('Sunflower Seed')),
                      DataCell(
                        Text(
                          Provider.of<Calculator>(
                            context,
                          ).nrSunflowerTiles.toString(),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Checkbox(
                          value: Provider.of<Calculator>(
                            context,
                          ).selectedFoodItems['isGrilledPotatoChecked'],
                          onChanged: (value) {
                            Provider.of<Calculator>(
                              context,
                              listen: false,
                            ).selectFoodItem('isGrilledPotatoChecked', value!);
                          },
                        ),
                      ),
                      DataCell(
                        Checkbox(
                          value: Provider.of<Calculator>(
                            context,
                          ).beehiveBuffApplied['isGrilledPotatoChecked'],
                          onChanged: (value) {
                            Provider.of<Calculator>(
                              context,
                              listen: false,
                            ).applyBeehiveBuff(
                              'isGrilledPotatoChecked',
                              value!,
                            );
                          },
                        ),
                      ),
                      DataCell(Text('Grilled Potato')),
                      DataCell(
                        Text(
                          Provider.of<Calculator>(
                            context,
                          ).nrPotatoTiles.toString(),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Checkbox(
                          value: Provider.of<Calculator>(
                            context,
                          ).selectedFoodItems['isBreadChecked'],
                          onChanged: (value) {
                            Provider.of<Calculator>(
                              context,
                              listen: false,
                            ).selectFoodItem('isBreadChecked', value!);
                          },
                        ),
                      ),
                      DataCell(
                        Checkbox(
                          value: Provider.of<Calculator>(
                            context,
                          ).beehiveBuffApplied['isWheatForBreadChecked'],
                          onChanged: (value) {
                            Provider.of<Calculator>(
                              context,
                              listen: false,
                            ).applyBeehiveBuff(
                              'isWheatForBreadChecked',
                              value!,
                            );
                          },
                        ),
                      ),
                      DataCell(Text('Bread (Wheat)')),
                      DataCell(
                        Text(
                          Provider.of<Calculator>(
                            context,
                          ).nrWheatTilesForBread.toString(),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Checkbox(
                          value: Provider.of<Calculator>(
                            context,
                          ).selectedFoodItems['isGrilledChestnutChecked'],
                          onChanged: (value) {
                            Provider.of<Calculator>(
                              context,
                              listen: false,
                            ).selectFoodItem(
                              'isGrilledChestnutChecked',
                              value!,
                            );
                          },
                        ),
                      ),
                      DataCell(Text('')),
                      DataCell(Text('Grilled Chestnut')),
                      DataCell(
                        Text(
                          Provider.of<Calculator>(
                            context,
                          ).nrChestnutTiles.toString(),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Checkbox(
                          value: Provider.of<Calculator>(
                            context,
                          ).selectedFoodItems['isCattailCrackerChecked'],
                          onChanged: (value) {
                            Provider.of<Calculator>(
                              context,
                              listen: false,
                            ).selectFoodItem('isCattailCrackerChecked', value!);
                          },
                        ),
                      ),
                      DataCell(
                        Checkbox(
                          value: Provider.of<Calculator>(
                            context,
                          ).beehiveBuffApplied['isCattailCrackerChecked'],
                          onChanged: (value) {
                            Provider.of<Calculator>(
                              context,
                              listen: false,
                            ).applyBeehiveBuff(
                              'isCattailCrackerChecked',
                              value!,
                            );
                          },
                        ),
                      ),
                      DataCell(Text('Cattail Cracker')),
                      DataCell(
                        Text(
                          Provider.of<Calculator>(
                            context,
                          ).nrCattailTiles.toString(),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Checkbox(
                          value: Provider.of<Calculator>(
                            context,
                          ).selectedFoodItems['isGrilledSpadderdockChecked'],
                          onChanged: (value) {
                            Provider.of<Calculator>(
                              context,
                              listen: false,
                            ).selectFoodItem(
                              'isGrilledSpadderdockChecked',
                              value!,
                            );
                          },
                        ),
                      ),
                      DataCell(
                        Checkbox(
                          value: Provider.of<Calculator>(
                            context,
                          ).beehiveBuffApplied['isGrilledSpadderdockChecked'],
                          onChanged: (value) {
                            Provider.of<Calculator>(
                              context,
                              listen: false,
                            ).applyBeehiveBuff(
                              'isGrilledSpadderdockChecked',
                              value!,
                            );
                          },
                        ),
                      ),
                      DataCell(Text('Grilled Spadderdock')),
                      DataCell(
                        Text(
                          Provider.of<Calculator>(
                            context,
                          ).nrSpadderdockTiles.toString(),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Checkbox(
                          value: Provider.of<Calculator>(
                            context,
                          ).selectedFoodItems['isPastryChecked'],
                          onChanged: (value) {
                            Provider.of<Calculator>(
                              context,
                              listen: false,
                            ).selectFoodItem('isPastryChecked', value!);
                          },
                        ),
                      ),
                      DataCell(Text('')),
                      DataCell(Text('Pastry')),
                      DataCell(Text('')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('')),
                      DataCell(
                        Checkbox(
                          value: Provider.of<Calculator>(
                            context,
                          ).beehiveBuffApplied['isWheatForPastryChecked'],
                          onChanged: (value) {
                            Provider.of<Calculator>(
                              context,
                              listen: false,
                            ).applyBeehiveBuff(
                              'isWheatForPastryChecked',
                              value!,
                            );
                          },
                        ),
                      ),
                      DataCell(Text('Wheat')),
                      DataCell(
                        Text(
                          Provider.of<Calculator>(
                            context,
                          ).nrWheatTilesForPastry.toString(),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('Maple')),
                      DataCell(
                        Text(
                          Provider.of<Calculator>(
                            context,
                          ).nrMapleTilesForPastry.toString(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
