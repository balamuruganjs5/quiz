import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(this.text, this.onSelect, {super.key});

  final String text;
  void Function(String value) onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          onSelect(text);
        },
        child: Text(
          text,
        ),
      ),
    );
  }
}
