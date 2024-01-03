import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onlinestore/model/products.dart';

class ApiService {
  String apiUrl;
  ApiService({required this.apiUrl});
  // final allCategories = 'https://fakestoreapi.com/products';
  // final allJewelleries = 'https://fakestoreapi.com/products/category/jewelery';
  // final allElectronics =
  //     'https://fakestoreapi.com/products/category/electronics';
  // final allClothings = '';
  Future<List<Products>> getProducts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final products = (json as List<dynamic>)
          .map((product) => Products.fromJson(product))
          .toList();
      return products;
    } else {
      throw Exception('Failed to get the products');
    }
  }

  // Future<List<Products>> getFilteredProducts() async {
  //   final response = await http.get(Uri.parse(allJewelleries));
  //   if (response.statusCode == 200) {
  //     final json = jsonDecode(response.body);
  //     final filteredProducts = (json as List<dynamic>)
  //         .map((filteredProduct) => Products.fromJson(filteredProduct))
  //         .toList();
  //     return filteredProducts;
  //   } else {
  //     throw Exception('Failed to load the products');
  //   }
  // }
}
