import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onlinestore/model/products.dart';

class ApiService {
  String apiUrl;
  ApiService({required this.apiUrl});
  Future<List<Products>> getProducts({String? query}) async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      var products = (json as List<dynamic>)
          .map((product) => Products.fromJson(product))
          .toList();
      if (query != null) {
        products = products
            .where((element) =>
                element.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
      return products;
    } else {
      throw Exception('Failed to get the products');
    }
  }
}
