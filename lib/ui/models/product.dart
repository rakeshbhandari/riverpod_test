class Product {
  final String id;
  final String title;
  final String description;
  final double price;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price});
}

final List<Product> productList = [
  Product(
      id: '1',
      title: 'Red Shirt',
      description: 'It is a pretty cool red shirt, you will like it.',
      price: 29.99),
  Product(
      id: '2',
      title: ' Blue Trousers',
      description: 'It is a pretty cool blue trouser, you will like it.',
      price: 59.99),
  Product(
      id: '3',
      title: 'Yellow Scarf',
      description: 'It is a pretty warm yellow scarf, you will love it.',
      price: 19.99),
  Product(
      id: '4',
      title: 'White shoes',
      description: 'It is a pretty damn cool white shoes, you will like it.',
      price: 49.99),
];
