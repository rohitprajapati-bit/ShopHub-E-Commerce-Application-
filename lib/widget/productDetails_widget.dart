import 'package:flutter/material.dart';

class ProductdetailsWidget extends StatelessWidget {
  final productdetails;
  const ProductdetailsWidget({super.key, this.productdetails});

  @override
  Widget build(BuildContext context) {
      return Column(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Hero(
                              tag: Key(productdetails.toString()),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Card(
                                  elevation: 6,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.network(
                                      productdetails?.image ?? '',
                                      height: 350,
                                      width: 350,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                  const  Text(
                                      "₹",
                                      style: TextStyle(fontSize: 35),
                                    ),
                                  const  SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      '${productdetails?.price}',
                                      style:const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  const  SizedBox(width: 15),
                                  const  Text(
                                      "(Inclusive of all taxes)",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Text(
                                  productdetails?.title ?? '',
                                  style:const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                ),
                               const SizedBox(height: 15),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        productdetails?.description ?? '',
                                        style:const TextStyle(fontSize: 16),
                                        textAlign: TextAlign.start,
                                        maxLines: 5,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},

                      //  async {
                      //   final Uri _url = Uri.parse(catalog.link.trim());
                      //   if (!await launchUrl(_url)) {
                      //     throw Exception('Could not launch $_url');
                      //   }
                      // },
                      minWidth: double.maxFinite,
                      height: 60,
                      color: Colors.amber[400],
                      child:const Text("Buy now",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      // style: ElevatedButton.styleFrom(
                      //   backgroundColor: Colors.amber[400],
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(0),
                      //   ),
                      // ),
                    )
                  ],
                );
              
  }
}