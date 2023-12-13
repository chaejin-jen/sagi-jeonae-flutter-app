import 'package:flutter/material.dart';
import 'package:sagi_jeonae_app/src/widgets/common/map_data_indexed_table.dart';

class SearchResultTable extends MapDataIndexedTable {
  const SearchResultTable({
    super.key,
    required super.data,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 1.0, color: Colors.black),
      columnWidths: const {
        0: MinColumnWidth(FixedColumnWidth(150), IntrinsicColumnWidth()),
        1: FlexColumnWidth(),
      },
      children: data.entries.mapIndexed((rIndex, entry) =>
          buildRow(rIndex, entry)).toList(),
    );
  }

  @override
  TableCell buildCell(int rIndex, int cIndex, dynamic cell) {
    return TableCell(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        color: rIndex.isEven ? Colors.grey[200] : null,
        child: cell is Map<String, dynamic>
            ? SearchResultTable(data: cell)
            : Text(
          cell.toString(),
          style: TextStyle(
            fontWeight: cIndex == 0 ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
