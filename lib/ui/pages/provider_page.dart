import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueProvider = Provider<String>((ref) =>'Rakesh' );

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Provider'),
          backgroundColor: color,
        ),
        body: Center(
          child: Text(
          'The value is ${ref.watch(valueProvider)}.',
          style: Theme.of(context).textTheme.headlineMedium,
              ),
        ),
      //we dont need this while using consumerwidget
        // Consumer(
        //   builder: (BuildContext context, WidgetRef ref, Widget? child) {
        //     return Center(
        //       child: Text(
        //         'The value is ${ref.watch(valueProvider)}',
        //         style: Theme.of(context).textTheme.headlineMedium,
        //       ),
        //     );
        //   },)
    );
  }
}
