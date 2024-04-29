import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

class AreasTable extends StatelessWidget {
  factory AreasTable.fromAreas(List<Area> areas) {
    return AreasTable._(controller: null, areas: areas);
  }

  factory AreasTable.fromController(MultiSplitViewController controller) {
    return AreasTable._(controller: controller, areas: null);
  }

  const AreasTable._({Key? key, required this.controller, required this.areas})
      : super(key: key);

  final MultiSplitViewController? controller;
  final List<Area>? areas;

  @override
  Widget build(BuildContext context) {
    if (controller != null) {
      return ListenableBuilder(
          listenable: controller!,
          builder: (context, child) => _buildTable(context, controller!.areas));
    }
    return _buildTable(context, areas!);
  }

  Widget _buildTable(BuildContext context, List<Area> areas) {
    List<TableRow> rows = [];
    // header
    rows.add(TableRow(
      decoration: BoxDecoration(color: Colors.grey[700]),
      children: <Widget>[
        _header('Area'),
        _header('Size'),
        _header('Flex'),
        _header('Min'),
        _header('Max')
      ],
    ));
    for (int index = 0; index < areas.length; index++) {
      Area area = areas[index];
      rows.add(TableRow(
        children: <Widget>[
          _cellString(_areaName(area)),
          _cellDouble(area.size),
          _cellDouble(area.flex),
          _cellDouble(area.min),
          _cellDouble(area.max)
        ],
      ));
    }

    return Table(
        border: TableBorder.all(color: Colors.grey[800]!),
        columnWidths: const <int, TableColumnWidth>{
          0: IntrinsicColumnWidth(),
          1: IntrinsicColumnWidth(),
          2: IntrinsicColumnWidth(),
          3: IntrinsicColumnWidth(),
          4: IntrinsicColumnWidth(),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: rows);
  }

  String _areaName(Area area) {
    if (area.data == null) {
      return '';
    }
    return area.data.toString();
  }

  Widget _header(String text) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 4, 64, 4),
        child: Text(text, style: const TextStyle(color: Colors.white)));
  }

  Widget _cellString(String value) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 4, 4, 4), child: Text(value));
  }

  Widget _cellDouble(double? value) {
    if (value != null) {
      return _cellString(value.toString());
    }
    return TableCell(
        verticalAlignment: TableCellVerticalAlignment.fill,
        child: Container(color: Colors.grey[300]));
  }
}
