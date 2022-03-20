import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ColumnData<T extends Object?> {
  ColumnData({
    required this.columnName,
    required this.dataValueCallback,
    required this.valueToStringCallback,
    this.contentAlignment = Alignment.center,
    this.columnWidthMode = ColumnWidthMode.none,
    this.isVisible = true,
    this.headerTooltip = '',
    this.contentTooltip,
    this.isImage = false,
  });

  final String columnName;
  final String headerTooltip;
  final String Function(Object?, T)? contentTooltip;
  final Alignment contentAlignment;
  final Object? Function(T) dataValueCallback;
  final String Function(Object?, T) valueToStringCallback;
  final ColumnWidthMode columnWidthMode;
  final bool isVisible;
  final bool isImage;
}
