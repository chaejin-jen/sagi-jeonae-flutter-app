import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  const BasicButton({
    super.key,
    required this.text,
    required this.onPressed
  });

  final String text;
  final Function onPressed;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(text),
    );
  }
}
