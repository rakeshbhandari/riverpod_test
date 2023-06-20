import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueStateProvider = StateProvider<int>((ref) => 100);

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(valueStateProvider);
    ref.listen<int>(valueStateProvider, (prev, nex) {
      if (nex == 110) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('You have already reached 110')));
      }

      // print('StateProviderPage: $prev -> $curr');
    });

    return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: const Text('State Provider'),
        ),
        body: Center(
            child: Column(children: [
          Text(
            'The value is $value.',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(valueStateProvider.notifier).state++;
            },
            child: const Text('Increment'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(valueStateProvider.notifier).state--;
            },
            child: const Text('Decrement'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.invalidate(valueStateProvider);
            },
            child: const Text('Invalidate'),
          )
        ])));
  }
}
