import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/ui/models/product.dart';
import 'package:riverpod_test/ui/pages/data/cart_notifier.dart';

// import 'data/cart_provider.dart';

class ChangeNotifierProviderPage extends ConsumerWidget {
  const ChangeNotifierProviderPage({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CartNotifier = ref.watch(cartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('ChangeNotifier Provider'),
        actions: [
          Stack(children: [
            //Shopping cart icon with a badge
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                // Show a dialog with the cart contents
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Center(child: Text('Cart')),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Show the cart contents
                          ...CartNotifier.cart.map((item) => Text(item.title)),
                          const SizedBox(height: 16),
                          // Sum the total price of the cart
                          Text(
                            'Total: \$${CartNotifier.cart.fold<double>(0, (sum, item) => sum + item.price)}',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Clear the cart
                            ref.read(cartNotifierProvider.notifier).clearCart();
                          },
                          child: const Text('Clear'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            //Badge
            Positioned(
              right: 0,
              top: 6,
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Text(
                  CartNotifier.cart.length.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ]),
        ],
      ),
      body: Column(
        children: [
          // A list of products and a button to add to cart
          Expanded(
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      // Add the product to the cart
                      ref
                          .read(cartNotifierProvider.notifier)
                          .addProduct(product);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
