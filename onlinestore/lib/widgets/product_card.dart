import 'package:flutter/material.dart';
import 'package:onlinestore/model/products.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.onTap});
  final Products product;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(right: 10.0),
          width: 150,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white70,
          ),
          child: Column(children: [
            ClipRRect(
              // borderRadius: BorderRadius.circular(20),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: product.image,
                fit: BoxFit.fitHeight,
                width: 150,
                height: 120,
              ),
            ),
            const SizedBox(height: 4),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(children: [
                  Row(children: [
                    const Icon(
                      Icons.star,
                      size: 12,
                      color: Colors.yellow,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      product.rating.rate.toString(),
                      style: const TextStyle(fontSize: 12),
                    )
                  ]),
                  Text(
                    product.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 12),
                    maxLines: 2,
                  ),
                ])),
            const SizedBox(height: 4),
            Text('\$ ${product.price.toString()}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14))
          ]),
        ),
      ),
    );
  }
}
