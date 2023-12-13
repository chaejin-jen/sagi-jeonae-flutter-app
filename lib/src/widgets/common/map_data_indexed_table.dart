import 'package:flutter/material.dart';

class MapDataIndexedTable extends StatelessWidget {
  const MapDataIndexedTable({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Table(
      children: data.entries.mapIndexed((rIndex, entry) =>
          buildRow(rIndex, entry)).toList(),
    );
  }

  TableRow buildRow(int rIndex, MapEntry<String, dynamic> entry) {
    return TableRow(
      children: [
        buildCell(rIndex, 0, entry.key),
        buildCell(rIndex, 1, entry.value),
      ],
    );
  }

  TableCell buildCell(int rIndex, int cIndex, dynamic cell) {
    return TableCell(
      child: cell is Map<String, dynamic>
          ? MapDataIndexedTable(data: cell)
          : Text(cell.toString()),
    );
  }
}

extension IterableExtension<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(int index, E element) f) sync* {
    var index = 0;
    for (var element in this) {
      yield f(index, element);
      index++;
    }
  }
}
