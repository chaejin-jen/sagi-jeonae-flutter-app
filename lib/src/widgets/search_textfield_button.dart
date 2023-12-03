import 'package:flutter/material.dart';

class SearchTextFieldButton extends StatelessWidget {
  const SearchTextFieldButton({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  final TextEditingController controller;
  final VoidCallback onSearch;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        labelText: '검색어를 입력하세요',
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: onSearch,
                  child: const Text('검색'),
                )
              ]
          ),
        ],
    );
  }
}
