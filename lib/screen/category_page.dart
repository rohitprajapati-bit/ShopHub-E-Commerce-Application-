import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopHub/screen/product_details.dart';
import 'package:shopHub/utility/all_products.dart';

class CategoryPage extends StatefulWidget {
  final List<Products> ProductCategory;

  const CategoryPage({super.key, required this.ProductCategory});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, List<Products>> categorizedProducts = {};
    for (var product in widget.ProductCategory) {
      if (!categorizedProducts.containsKey(product.category)) {
        categorizedProducts[product.category ?? ""] = [];
      }
      categorizedProducts[product.category]!.add(product);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        centerTitle: true,
        // backgroundColor: Colors.grey.shade200,
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/animation/categoryPage_animation.json',
                height: 200, width: 350, fit: BoxFit.cover),
            const SizedBox(
              height: 25,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: categorizedProducts.keys.length,
              itemBuilder: (context, index) {
                String category = categorizedProducts.keys.elementAt(index);
                List<Products> categoryProducts =
                    categorizedProducts[category]!;

                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  elevation: 4,
                  child: ExpansionTile(
                    title: Text(
                      category,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: categoryProducts.map((product) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Card(
                          elevation: 5,
                          color: Colors.white,
                          child: ListTile(
                            contentPadding: EdgeInsets.all(12),
                            leading: Container(
                              child: Image.network(
                                product.image ?? "",
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              product.title ?? "",
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text('\$${product.price.toString()}',
                                  style: TextStyle(color: Colors.grey[600])),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductWidget(
                                          productId: product.id!)));
                            },
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
