import 'package:flutter/material.dart';
import 'package:sagi_jeonae_app/src/widgets/common/indexed_table.dart';

class SearchResultTable extends IndexedTable {
  const SearchResultTable({
    super.key,
    required super.data,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 1.0, color: Colors.black),
      columnWidths: const {
        0: FixedColumnWidth(150.0),
        1: FlexColumnWidth(),
      },
      children: data.mapIndexed((rIndex, row) => buildRow(rIndex, row)).toList(),
    );
  }

  @override
  TableCell buildCell(int rIndex, int cIndex, String cell) {
    return TableCell(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        color: rIndex.isEven ? Colors.grey[200] : null,
        child: Text(
          cell,
          style: TextStyle(
            fontWeight: cIndex == 0 ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
