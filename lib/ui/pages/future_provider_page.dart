// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/ui/models/suggestion.dart';
import 'package:riverpod_test/ui/services/api_service.dart';

final suggestionFutureProvider = FutureProvider.autoDispose<Suggestion>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getSuggestion();
});

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionRef = ref.watch(suggestionFutureProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: const Text('Future Provider'),
        ),
        body: Center(
          child: suggestionRef.when(data: (data) {
            return Text(
              data.activity,
              style: Theme.of(context).textTheme.headlineMedium,
            );
            // Text(
            //   data.type,
            //   style: Theme.of(context).textTheme.headlineSmall,
            // );
            
          }, error: (error, _) {
            return Text(error.toString());
          }, loading: () {
            return const CircularProgressIndicator();
          }),
        ));
  }
}
