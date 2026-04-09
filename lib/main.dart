import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:timberborn_assistant/calculator.dart';
import 'package:timberborn_assistant/folktails.dart';
import 'package:timberborn_assistant/irontheeth.dart';

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
    Faction faction = Provider.of<Calculator>(context).faction;
    return Scaffold(
      appBar: AppBar(title: const Text('Timberborn Assistant')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropdownMenu<Faction>(
                dropdownMenuEntries: [
                  DropdownMenuEntry(
                    value: Faction.folkTails,
                    label: 'Folktails',
                  ),
                  DropdownMenuEntry(
                    value: Faction.ironTeeth,
                    label: 'Ironteeth',
                  ),
                ],
                initialSelection: Faction.folkTails,
                label: Text('Faction'),
                onSelected: (value) {
                  Provider.of<Calculator>(
                    context,
                    listen: false,
                  ).setFaction(value!);
                },
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
                  SizedBox(width: 16),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Working hours',
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          Provider.of<Calculator>(
                            context,
                            listen: false,
                          ).setWorkingHours(int.parse(value));
                        } else {
                          Provider.of<Calculator>(
                            context,
                            listen: false,
                          ).setWorkingHours(0);
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              faction == Faction.folkTails ? Folktails() : Irontheeth(),
            ],
          ),
        ),
      ),
    );
  }
}
