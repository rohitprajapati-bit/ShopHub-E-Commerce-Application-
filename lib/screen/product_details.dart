import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopHub/utility/all_products.dart';
import 'package:shopHub/widget/productDetails_widget.dart';

class ProductWidget extends StatefulWidget {
  final int productId;

  const ProductWidget({
    super.key,
    required this.productId,
  });

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  late Future<Products> futurProduct;
  @override
  void initState() {
    super.initState();
    futurProduct = fechProductsDetails(widget.productId);
  }

  Future<Products> fechProductsDetails(int id) async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/$id'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseDecode = jsonDecode(response.body);
      final Products products = Products.fromJson(responseDecode);

      return products;
    }
    throw Exception('Failed to load product');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Text('Product Details'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: FutureBuilder<Products>(
            future: futurProduct,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                Products? products = snapshot.data!;

                return ProductdetailsWidget(
                  productdetails: products,
                );
              }
              throw Exception('Failed to load product');
            }),
      ),
    );
  }
}
