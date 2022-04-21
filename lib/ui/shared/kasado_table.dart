import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasado/model/column_data/column_data.dart';
import 'package:kasado/model/stats/stats.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class KasadoTable<T extends Object> extends StatelessWidget {
  const KasadoTable({
    Key? key,
    required this.height,
    required this.width,
    required this.dataAsList,
    this.onRowSelected,
    this.frozenColumnCount = 0,
    required this.columnDataList,
    this.colIndexToSummaryType = const {},
    this.needCountSummary = false,
    this.columnHeaderColor = Colors.grey,
  }) : super(key: key);

  final double height;
  final double width;
  final List<T> dataAsList;
  final void Function(T?)? onRowSelected;
  final int frozenColumnCount;
  final List<ColumnData<T>> columnDataList;
  final Map<int, GridSummaryType> colIndexToSummaryType;
  final bool needCountSummary;
  final Color columnHeaderColor;

  @override
  Widget build(BuildContext context) {
    final defaultColumnWidthMode =
        (frozenColumnCount != 0) ? ColumnWidthMode.auto : ColumnWidthMode.fill;
    final leastSummaryIndex = (colIndexToSummaryType.isNotEmpty)
        ? colIndexToSummaryType.keys.reduce(min)
        : null;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SfDataGridTheme(
        data: SfDataGridThemeData(
          selectionColor: Colors.blue.shade100.withOpacity(0.4),
        ),
        child: SfDataGrid(
          allowSorting: true,
          allowTriStateSorting: true,
          frozenColumnsCount: frozenColumnCount,
          columnWidthMode: defaultColumnWidthMode,
          columnWidthCalculationRange: ColumnWidthCalculationRange.allRows,
          verticalScrollPhysics: const NeverScrollableScrollPhysics(),
          selectionMode: (onRowSelected != null)
              ? SelectionMode.singleDeselect
              : SelectionMode.none,
          onSelectionChanged: (onRowSelected != null)
              ? (addedRows, _) {
                  if (addedRows.isEmpty) {
                    onRowSelected!(null);
                  } else {
                    final selectedRow = addedRows.first;
                    selectedRow as MarnikkoDataGridRow<T>;
                    onRowSelected!.call(selectedRow.data);
                  }
                }
              : null,
          columns: columnDataList.map((colData) {
            return GridColumn(
              columnWidthMode: (dataAsList.isEmpty)
                  ? defaultColumnWidthMode
                  : colData.columnWidthMode,
              columnName: colData.columnName,
              visible: colData.isVisible,
              label: Container(
                color: columnHeaderColor,
                child: Tooltip(
                  preferBelow: false,
                  message: colData.headerTooltip,
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      colData.columnName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
          source: MarnikkoDataGridSource<T>(
            columnDataList: columnDataList,
            dataAsList: dataAsList,
          ),
          tableSummaryRows: (colIndexToSummaryType.isNotEmpty &&
                      dataAsList.isNotEmpty ||
                  needCountSummary)
              ? [
                  GridTableSummaryRow(
                    color: Colors.grey.shade200,
                    showSummaryInRow: false,
                    title: (needCountSummary) ? 'Total Count: {count}' : null,
                    titleColumnSpan: (needCountSummary)
                        ? (leastSummaryIndex != null)
                            ? (columnDataList.length - leastSummaryIndex + 1)
                            : columnDataList.length
                        : 0,
                    columns: colIndexToSummaryType.entries.map((i2sEntry) {
                      final colData = columnDataList[i2sEntry.key];
                      final summaryType = i2sEntry.value;

                      return GridSummaryColumn(
                        name: colData.columnName,
                        columnName: colData.columnName,
                        summaryType: summaryType,
                      );
                    }).toList()
                      ..addAll(
                        (needCountSummary)
                            ? [
                                GridSummaryColumn(
                                  name: 'count',
                                  columnName: columnDataList.first.columnName,
                                  summaryType: GridSummaryType.count,
                                )
                              ]
                            : [],
                      ),
                    position: GridTableSummaryRowPosition.bottom,
                  )
                ]
              : [],
        ),
      ),
    );
  }
}

class MarnikkoDataGridSource<T extends Object> extends DataGridSource {
  MarnikkoDataGridSource({
    required List<T> dataAsList,
    required this.columnDataList,
  }) {
    _dataRows = dataAsList.map<DataGridRow>(
      (data) {
        return MarnikkoDataGridRow<T>(
          data: data,
          cells: columnDataList.map((columnData) {
            columnData as ColumnData<T>;

            return DataGridCell(
              columnName: columnData.columnName,
              value: columnData.dataValueCallback(data),
            );
          }).toList(),
        );
      },
    ).toList();
  }

  List<DataGridRow> _dataRows = [];
  final List<ColumnData> columnDataList;

  @override
  List<DataGridRow> get rows => _dataRows;

  @override
  Widget? buildTableSummaryCellWidget(
    GridTableSummaryRow summaryRow,
    GridSummaryColumn? summaryColumn,
    RowColumnIndex rowColumnIndex,
    String summaryValue,
  ) {
    final columnData = columnDataList.where(
      (colData) => (colData.columnName == summaryColumn?.columnName),
    );

    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: (columnData.isNotEmpty)
          ? columnData.first.contentAlignment
          : Alignment.center,
      child: Text(
        (double.tryParse(summaryValue) != null)
            ? NumberFormat.currency(symbol: '', decimalDigits: 2)
                .format(double.parse(summaryValue))
            : summaryValue,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    row as MarnikkoDataGridRow<T>;

    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((cell) {
      final columnData = columnDataList.singleWhere(
        (colData) => (colData.columnName == cell.columnName),
      ) as ColumnData<T>;

      return Tooltip(
        message: columnData.contentTooltip?.call(cell.value, row.data) ?? '',
        padding: const EdgeInsets.all(8.0),
        child: (columnData.isImage)
            ? Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        // TODO: Hardcoding this works as of writing as the KasadoTable
                        // is only useful for showing stats as of now. Might change
                        // in the future. Refactor if necessary
                        (row.data as Stats).player.photoUrl!,
                      ),
                      fit: BoxFit.contain,
                    ),
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            : Container(
                alignment: columnData.contentAlignment,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    columnData.valueToStringCallback(cell.value, row.data)),
              ),
      );
    }).toList());
  }
}

class MarnikkoDataGridRow<T extends Object> extends DataGridRow {
  MarnikkoDataGridRow({
    required this.data,
    required List<DataGridCell<dynamic>> cells,
  }) : super(cells: cells);
  final T data;
}
