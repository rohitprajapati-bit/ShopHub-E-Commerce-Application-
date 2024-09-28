import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopHub/utility/cart_product.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Future<List<CartProduct>> cartProductList;

  @override
  void initState() {
    super.initState();
    cartProductList = fechCartData();
  }

  Future<List<CartProduct>> fechCartData() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/carts'));
    if (response.statusCode == 200) {
      final List responseDecode = jsonDecode(response.body);
      List<CartProduct> cardProductData = [];

      for (int i = 0; i < responseDecode.length; i++) {
        final data = CartProduct.fromJson(responseDecode[i]);
        cardProductData.add(data);
      }
      return cardProductData;
    }
    throw Exception('Failed to load product');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<CartProduct>>(
        future: cartProductList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            List<CartProduct> cartList = snapshot.data!;
            return ListView.builder(
              itemCount: cartList.length,
              
              itemBuilder: (context, index) {
                CartProduct cartProduct = cartList[index];
                
                return Card(
                  color: Colors.white,
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cart ID: ${cartProduct.id}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          'User ID: ${cartProduct.userId}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Date: ${cartProduct.products}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Total Products: ${cartProduct.products?.length ?? 0}',
                          style: TextStyle(fontSize: 16),
                        ),

                        ListView.builder(
                          shrinkWrap: true, // Prevents the ListView from taking infinite height
                          physics: NeverScrollableScrollPhysics(), // Prevents internal scrolling
                          itemCount: cartProduct.products?.length ?? 0,
                          itemBuilder: (context, productIndex) {
                            var product = cartProduct.products![productIndex];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Product ID: ${product.productId}'),
                                  Text('Quantity: ${product.quantity}'),
                                ],
                              ),
                            );
                          },
                        ),

                        Text(
                          'Version: ${cartProduct.iV}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Text('No data available');
        },
      ),
    );
  }
}
