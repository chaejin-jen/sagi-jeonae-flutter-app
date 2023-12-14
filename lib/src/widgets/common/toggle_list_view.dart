import 'package:flutter/material.dart';

class ToggleListView extends StatefulWidget {
  final List<Widget> children;
  final List<String>? customTitles;

  const ToggleListView({
    super.key,
    required this.children,
    this.customTitles,
  });

  @override
  ToggleListViewState createState() => ToggleListViewState();
}

class ToggleListViewState extends State<ToggleListView> {
  late List<bool> _toggleState;

  List<String> get titles =>
      widget.customTitles ??
          List.generate(widget.children.length, (index) => 'Item $index');

  @override
  void initState() {
    super.initState();
    _toggleState = List.generate(widget.children.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.children.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              title: Text(titles[index]),
              trailing: _toggleState[index]
                  ? const Icon(Icons.expand_less)
                  : const Icon(Icons.expand_more),
              onTap: () {
                setState(() {
                  _toggleState[index] = !_toggleState[index];
                });
              },
            ),
            if (_toggleState[index]) widget.children[index],
          ],
        );
      },
    );
  }
}
