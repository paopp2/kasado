import 'package:flutter/material.dart';
import 'package:kasado/model/column_data/column_data.dart';
import 'package:kasado/model/stats/stats.dart';
import 'package:kasado/ui/shared/kasado_table.dart';

class TeamStatTable extends StatelessWidget {
  const TeamStatTable({
    Key? key,
    required this.constraints,
    required this.statsList,
  }) : super(key: key);

  final BoxConstraints constraints;
  final List<Stats> statsList;

  @override
  Widget build(BuildContext context) {
    return KasadoTable<Stats>(
      height: constraints.maxHeight * 0.5,
      width: constraints.maxWidth,
      frozenColumnCount: 1,
      dataAsList: statsList,
      columnDataList: [
        ColumnData(
          columnName: "PLAYER",
          // Value not required as this column will only show the user's CircleAvatar
          dataValueCallback: (stats) => '',
          valueToStringCallback: (playerPhoto, stats) => playerPhoto as String,
          isImage: true,
        ),
        ColumnData(
          columnName: "NAME",
          dataValueCallback: (stats) => stats.player.displayName,
          valueToStringCallback: (playerName, stats) => playerName as String,
        ),
        ColumnData(
          columnName: "PTS",
          dataValueCallback: (stats) => stats.points,
          valueToStringCallback: (points, stats) => points.toString(),
        ),
        ColumnData(
          columnName: "REB",
          dataValueCallback: (stats) => stats.rebounds,
          valueToStringCallback: (rebounds, stats) => rebounds.toString(),
        ),
        ColumnData(
          columnName: "AST",
          dataValueCallback: (stats) => stats.ast,
          valueToStringCallback: (assists, stats) => assists.toString(),
        ),
      ],
    );
  }
}
