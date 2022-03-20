import 'package:flutter/material.dart';
import 'package:kasado/model/column_data/column_data.dart';
import 'package:kasado/ui/shared/kasado_table.dart';

class SlotGameStatsTab extends StatelessWidget {
  const SlotGameStatsTab({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "HOME",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              KasadoTable<String>(
                height: constraints.maxHeight * 0.5,
                width: constraints.maxWidth,
                frozenColumnCount: 1,
                dataAsList: const [
                  "Hello",
                  "Po",
                  "Hello",
                  "Po",
                  "Hello",
                ],
                columnDataList: [
                  ColumnData(
                    columnName: "Name",
                    dataValueCallback: (val) => val,
                    valueToStringCallback: (val, valu) => valu,
                  ),
                  ColumnData(
                    columnName: "Name 2",
                    dataValueCallback: (val) => val,
                    valueToStringCallback: (val, valu) => valu,
                  ),
                  ColumnData(
                    columnName: "Name 3",
                    dataValueCallback: (val) => val,
                    valueToStringCallback: (val, valu) => valu,
                  ),
                  ColumnData(
                    columnName: "Name 4",
                    dataValueCallback: (val) => val,
                    valueToStringCallback: (val, valu) => valu,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "AWAY",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              KasadoTable<String>(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                frozenColumnCount: 1,
                dataAsList: const [
                  "Hello",
                  "Po",
                  "Hello",
                  "Po",
                  "Hello",
                ],
                columnDataList: [
                  ColumnData(
                    columnName: "Name",
                    dataValueCallback: (val) => val,
                    valueToStringCallback: (val, valu) => valu,
                  ),
                  ColumnData(
                    columnName: "Name 2",
                    dataValueCallback: (val) => val,
                    valueToStringCallback: (val, valu) => valu,
                  ),
                  ColumnData(
                    columnName: "Name 3",
                    dataValueCallback: (val) => val,
                    valueToStringCallback: (val, valu) => valu,
                  ),
                  ColumnData(
                    columnName: "Name 4",
                    dataValueCallback: (val) => val,
                    valueToStringCallback: (val, valu) => valu,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'G1',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('G2'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('G3'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('G4'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('G5'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('G6'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('G7'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('G8'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
