import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(10),
        color: Theme.of(context).colorScheme.inversePrimary,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
