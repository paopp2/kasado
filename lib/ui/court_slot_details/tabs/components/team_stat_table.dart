import 'package:flutter/material.dart';
import 'package:kasado/logic/shared/kasado_utils.dart';
import 'package:kasado/model/column_data/column_data.dart';
import 'package:kasado/model/stats/stats.dart';
import 'package:kasado/ui/shared/kasado_table.dart';

class TeamStatTable extends StatelessWidget {
  const TeamStatTable({
    Key? key,
    required this.constraints,
    required this.statsList,
    required this.utils,
  }) : super(key: key);

  final BoxConstraints constraints;
  final List<Stats> statsList;
  final KasadoUtils utils;

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
        ColumnData(
          columnName: "FGM / FGA",
          dataValueCallback: (stats) => stats.totalAttempts,
          valueToStringCallback: (_, stats) =>
              "${stats.totalMade} / ${stats.totalAttempts}",
        ),
        ColumnData(
          columnName: "FG %",
          dataValueCallback: (stats) => stats.fgPercent,
          valueToStringCallback: (fgPercent, stats) =>
              utils.getPercentageFormat(fgPercent as double),
        ),
      ],
    );
  }
}
