import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/ui/models/product.dart';

class CartStateNotifier extends StateNotifier<List<Product>> {
  CartStateNotifier() : super([]);

  void addProduct(Product product) {
    state = [...state, product];
  }

  void removeProduct(Product product) {
    state = state.where((p) => p != product).toList();
  }

  void clearProduct(Product product) {
    state = [];
  }
}
