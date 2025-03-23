import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_projects/provider/example_4_cart_provider.dart';

class CartProviderScreen extends StatefulWidget {
  const CartProviderScreen({super.key});

  @override
  State<CartProviderScreen> createState() => _CartProviderScreenState();
}

class _CartProviderScreenState extends State<CartProviderScreen> {
  final List<String> products = ["Shoes", "Bag", "Watch", "Laptop"];

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("Shopping Cart")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(products[index]),
                  trailing: IconButton(
                      onPressed: () => cartProvider.addItem(products[index]),
                      icon: Icon(Icons.add_shopping_cart),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Text(
            "Cart Items: ${cartProvider.cartItems.length}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Consumer<CartProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                  itemCount: provider.cartItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(provider.cartItems[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.remove, color: Colors.red),
                        onPressed: () => provider.removeItem(provider.cartItems[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
