import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopHub/screen/Cart_Page.dart';
import 'package:shopHub/screen/account_page.dart';
import 'package:shopHub/screen/category_page.dart';
import 'package:shopHub/utility/all_products.dart';
import 'package:shopHub/widget/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Products>> productList;
  List<Products>? AllProduct;
  int _selectedIndex = 0;
  List<Products>? filteredProducts;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    productList = fetchProducts();
  }

  Future<List<Products>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final List responseDecode = jsonDecode(response.body);
      List<Products> productData = [];
      for (int i = 0; i < responseDecode.length; i++) {
        final data = Products.fromJson(responseDecode[i]);
        productData.add(data);
      }
      return productData;
    }
    print("error");
    return [];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AccountPage()),
      ).then((_) {
        setState(() {
          _selectedIndex = 0;
        });
      });
    } else if (index == 2) {
      if (AllProduct != null && AllProduct!.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CategoryPage(ProductCategory: AllProduct!)),
        ).then((_) {
          setState(() {
            _selectedIndex = 0;
          });
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Products are still loading...')),
        );
      }
    }
  }

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      List<Products> dummyListData = [];
      AllProduct?.forEach((item) {
        if (item.title!.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        filteredProducts = dummyListData;
      });
    } else {
      setState(() {
        filteredProducts = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade100,
        title: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      filterSearchResults(value);
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search Products...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartPage()));
                    },
                    icon: const Icon(Icons.shopping_cart))
              ],
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: FutureBuilder<List<Products>>(
          future: productList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              AllProduct = snapshot.data;
              final displayProducts = filteredProducts ?? AllProduct;

              return ListView.builder(
                itemCount: displayProducts?.length,
                itemBuilder: (context, index) {
                  final products = displayProducts?[index];

                  return HomeWidget(
                    product: products,
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: ' Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_sharp),
            label: 'Categories',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
