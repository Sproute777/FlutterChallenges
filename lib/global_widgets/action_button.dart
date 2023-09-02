import 'package:flutter/material.dart';
import 'package:flutterchallenges/theme/pallete_color.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.action,
    required this.label,
  });

  final VoidCallback action;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(
          maximumSize: const Size(double.maxFinite, 50),
          backgroundColor: PalleteColor.actionButtonColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
