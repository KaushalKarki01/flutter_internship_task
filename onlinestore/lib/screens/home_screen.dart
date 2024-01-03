import 'package:flutter/material.dart';
import 'package:onlinestore/screens/dummy.dart';
import 'package:onlinestore/widgets/category_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(26, 181, 140, 140),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const TextField(
                    cursorColor: Colors.blueGrey,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'search products here...',
                        suffixIcon: Icon(
                          Icons.search,
                          size: 30,
                        )),
                  )),
              const SizedBox(height: 20),
              const CategoryTitle(title: 'Clothing'),
              Container(
                height: 200,
                alignment: Alignment.center,
                child: const DummyPage(
                    apiUrl:
                        'https://fakestoreapi.com/products/category/jewelery'),
              ),
              const SizedBox(height: 20),
              const CategoryTitle(title: 'Jewelleries'),
              Container(
                height: 200,
                alignment: Alignment.center,
                child: const DummyPage(
                    apiUrl:
                        'https://fakestoreapi.com/products/category/jewelery'),
              ),
              const SizedBox(height: 20),
              const CategoryTitle(title: 'Electronics'),
              Container(
                height: 200,
                alignment: Alignment.center,
                child: const DummyPage(
                    apiUrl:
                        'https://fakestoreapi.com/products/category/electronics'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
