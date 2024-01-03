import 'package:flutter/material.dart';
import 'package:onlinestore/model/products.dart';
import 'package:onlinestore/widgets/button.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final Products product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(product.title)),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
            color: Colors.white70,
            child: Column(
              children: [
                Image.network(
                  product.image,
                  height: 400,
                  width: double.infinity,
                ),
                const SizedBox(height: 10),
                Text(product.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500)),
                const SizedBox(height: 10),
                Text(product.description, style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 10),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\$ ${product.price.toString()}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    )),
                const SizedBox(height: 20),
                const ReusableBtn(title: 'Buy Now')
              ],
            ),
          ),
        ));
  }
}
