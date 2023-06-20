import 'package:flutter/material.dart';

class StateNotifierProviderPage extends StatelessWidget {
  const StateNotifierProviderPage({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('change notifier Provider'),
      ),
    );
  }
}
