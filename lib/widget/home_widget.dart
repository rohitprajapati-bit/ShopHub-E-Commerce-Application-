import 'package:flutter/material.dart';
import 'package:shopHub/screen/product_details.dart';

class HomeWidget extends StatelessWidget {
  final product;
  const HomeWidget({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Container(
          height: 180,
          child: Card(
              elevation: 5,
              child: Row(children: [
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 160,
                      child: Card(
                        elevation: 2,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            product?.image ?? '',
                            width: 120,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductWidget(
                                  productId: product.id,
                                )));
                  },
                ),
              const  SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          product?.title ?? '',
                          style: TextStyle(fontSize: 18),
                          maxLines: 2,
                        ),
                      ),
                    const  SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              product?.description ?? '',
                              maxLines: 2,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                        ],
                      ),
                    const  SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                            const  Text("₹", style: TextStyle(fontSize: 22)),
                            const  SizedBox(
                                width: 1,
                              ),
                              Text(
                                '${product?.price}',
                                style:const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        const  SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'Add to Cart ${product?.title ?? ''}')));
                              },

                              // async {
                              //   final Uri _url = Uri.parse(
                              //       catalog.link.trim());
                              //   if (!await launchUrl(_url)) {
                              //     throw Exception(
                              //         'Could not launch $_url');
                              //   }
                              //   print(catalog.link);
                              // },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade300,
                              ),
                              child:const Icon(
                                Icons.shopping_cart,
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              const  SizedBox(
                  width: 10,
                ),
              ])),
        ),
      ),
      // color: Colors.white,
    );
  }
}
