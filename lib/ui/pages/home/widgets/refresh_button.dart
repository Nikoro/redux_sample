import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({required this.onPressed, Key? key}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.refresh),
    );
  }
}
