import 'package:flutter/material.dart';
import 'package:onlinestore/model/products.dart';
import 'package:onlinestore/screens/detail_screen.dart';
import 'package:onlinestore/services/api_service.dart';
import 'package:onlinestore/services/api_urls.dart';
import 'package:onlinestore/widgets/product_card.dart';

class SearchProducts extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
    // throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // throw UnimplementedError();
  }

  ApiService apiService = ApiService(apiUrl: ApiUrls().allproducts);
  List<Products> _products = [];

  @override
  Widget buildResults(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder<List<Products>>(
              future: apiService.getProducts(query: query),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  _products = snapshot.data!;
                  // return ListView.builder(
                  //     itemCount: _products.length,
                  //     itemBuilder: (context, index) {
                  //       return ProductCard(
                  //         product: _products[index],
                  //         onTap: () {
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => ProductDetailScreen(
                  //                       product: _products[index])));
                  //         },
                  //       );
                  //     });
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, mainAxisSpacing: 20),
                      itemCount: _products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                            product: _products[index],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetailScreen(
                                            product: _products[index],
                                          )));
                            });
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

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text('Search Products'));
  }
}
