import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/Views/Detail%20Page.dart';
import 'package:project/Models/models.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Fetchdata() async {
    var url = Uri.https('https://fakestoreapi.com/products');
    var response = await http.get(url);
    dynamic res = response.body;
// var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    var urls = Uri.https('https://fakestoreapi.com/products');

    jsonDecode(response as String);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        FutureBuilder<dynamic>(
            future: Fetchdata(),
            builder: (context, snapshot) {
              return Expanded(
                child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                          title: products[index]['title'],
                                          price: products[index]['price']
                                              .toString(),
                                          details: products[index]['Details'],
                                        ))),
                            child: Container(
                              height: 200,
                              width: 150,
                              child: Card(
                                child: Container(
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 160,
                                        decoration: BoxDecoration(
                                            color: Colors.black12),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Text(
                                            "Product Name: ${products[index]['title']}"),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Text(
                                            "Price: ${products[index]['price'].toString()}"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
              );
            })
      ]),
    );
  }
}
