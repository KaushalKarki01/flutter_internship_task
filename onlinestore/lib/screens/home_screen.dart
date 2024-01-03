import 'package:flutter/material.dart';
import 'package:onlinestore/screens/dummy.dart';
import 'package:onlinestore/services/api_urls.dart';
import 'package:onlinestore/widgets/category_title.dart';
import 'package:onlinestore/widgets/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(children: [
              const Text('Fake',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
              Text('Commerce',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.amber[600])),
            ]),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: SearchProducts());
                },
              )
            ]),
        body: SingleChildScrollView(
          child: Container(
            color: const Color.fromARGB(26, 181, 140, 140),
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SafeArea(
              child: Column(
                children: [
                  const CategoryTitle(title: 'All Products'),
                  Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: DummyPage(apiUrl: ApiUrls().allproducts),
                  ),
                  const SizedBox(height: 20),
                  const CategoryTitle(title: 'Jewelleries'),
                  Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: DummyPage(apiUrl: ApiUrls().jewelleries),
                  ),
                  const SizedBox(height: 20),
                  const CategoryTitle(title: 'Electronics'),
                  Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: DummyPage(apiUrl: ApiUrls().electronics),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
