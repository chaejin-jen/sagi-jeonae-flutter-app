import 'package:flutter/material.dart';

class BasicTable extends StatelessWidget {
  const BasicTable({
    super.key,
    required this.data,
  });

  final List<List<String>> data;


  @override
  Widget build(BuildContext context) {
    return Table(
      children: data.map((row) {
        return TableRow(
          children: row.map((cell) {
            return TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(cell),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
