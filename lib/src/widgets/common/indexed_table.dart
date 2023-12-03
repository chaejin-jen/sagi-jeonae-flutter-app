import 'package:flutter/material.dart';

class IndexedTable extends StatelessWidget {
  const IndexedTable({
    super.key,
    required this.data,
  });

  final List<List<String>> data;

  @override
  Widget build(BuildContext context) {
    return Table(
      children: data.mapIndexed((rIndex, row) => buildRow(rIndex, row)).toList(),
    );
  }

  TableRow buildRow(int rIndex, List<String> row) {
    return TableRow(
      children: row.mapIndexed((cIndex, cell) => buildCell(rIndex, cIndex, cell)).toList(),
    );
  }

  TableCell buildCell(int rIndex, int cIndex, String cell) {
    return TableCell(
      child: Text('$cIndex $cell'),
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
