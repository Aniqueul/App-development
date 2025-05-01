import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../lab8/product.dart';
import 'cart_page.dart';

class ProductList extends StatelessWidget {
  ProductList({super.key});

  final CartController cartController = Get.put(CartController());

  final List<Product> products = [
    Product(id: 1, name: 'Shoes', price: 59.99),
    Product(id: 2, name: 'T-Shirt', price: 19.99),
    Product(id: 3, name: 'Jeans', price: 39.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Get.to(() => const CartPage());
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
            trailing: ElevatedButton(
              onPressed: () {
                cartController.addToCart(product);
              },
              child: const Text('Add'),
            ),
          );
        },
      ),
    );
  }
}
