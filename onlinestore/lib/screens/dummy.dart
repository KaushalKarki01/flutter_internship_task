import 'package:flutter/material.dart';
import 'package:onlinestore/model/products.dart';
import 'package:onlinestore/screens/detail_screen.dart';
import 'package:onlinestore/services/api_service.dart';
import 'package:onlinestore/widgets/product_card.dart';

class DummyPage extends StatefulWidget {
  final String apiUrl;
  const DummyPage({super.key, required this.apiUrl});

  @override
  State<DummyPage> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  // ApiService apiService = ApiService(apiUrl:widget.apiUrl);
  ApiService? apiService;

  List<Products> _products = [];
  @override
  void initState() {
    apiService = ApiService(apiUrl: widget.apiUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FutureBuilder<List<Products>>(
              future: apiService!.getProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  _products = snapshot.data!;
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: _products[index],
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailScreen(
                                        product: _products[index])));
                          },
                        );
                      });
                } else {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.amberAccent,
                  ));
                }
              }),
        ),
      ],
    );
  }
}
