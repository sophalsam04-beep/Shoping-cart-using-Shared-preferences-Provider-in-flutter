import 'package:self_learn5/provider/product_provider.dart';
import 'package:self_learn5/screen/cart_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:self_learn5/model/product_model.dart';
import 'package:self_learn5/screen/cart_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<ProductModel> products = [
    ProductModel(name: "IPhone 15 Pro Max", price: 500),
    ProductModel(name: "IPhone 16 Pro Max", price: 570),
    ProductModel(name: "IPhone 17 Pro Max", price: 400),
    ProductModel(name: "IPhone 18 Pro Max", price: 500),
    ProductModel(name: "IPhone 119 Pro Max", price: 800),
    ProductModel(name: "IPhone X Pro Max", price: 700),
    ProductModel(name: "IPhone XS Pro Max", price: 990),
    ProductModel(name: "IPhone 7 SE Pro Max", price: 450),
    ProductModel(name: "IPhone 11 Max", price: 540),
  ];

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CartScreen()),
            ),
            icon: Badge(label: Text(cartProvider.cartItem.length.toString()), child: Icon(Icons.shopping_cart_rounded),),
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return ListTile(
            title: Text(product.name),
            subtitle: Text("\$${product.price}"),
            trailing: ElevatedButton(onPressed: (){
                cartProvider.addToCart(product);
            }, child: Text("Add to Cart")),
          );
        },
      ),
    );
  }
}
