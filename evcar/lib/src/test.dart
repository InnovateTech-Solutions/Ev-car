import 'dart:convert';

import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/google_map/view/widget/widget_collection/search_container.dart';
import 'package:evcar/src/feature/maintenance/widget/text/maintenance_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      locale: const Locale('ar', 'AE'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, List<dynamic>> data = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    const String apiUrl =
        'https://good-plum-agouti-hose.cyclic.app/vendors/getAllVendorProductsByToken';
    const String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJudW1iZXIiOiI5NjI3OTEzNjgxOTEiLCJ0eXBlIjoic3RvcmUiLCJpYXQiOjE3MDg3ODgzMjIsImV4cCI6MTcwOTk5NzkyMn0.IsvLITsB5B5Z5J_fuyXvFqwVanxiZnVe99i0dULCn8M';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);

      if (responseData.containsKey('classifiedProducts') &&
          responseData['classifiedProducts'] is Map<String, dynamic>) {
        setState(() {
          data = Map<String, List<dynamic>>.from(
              responseData['classifiedProducts']);
        });
      } else {
        throw Exception('Invalid data format');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  void deleteItem(String categoryId, int index) {
    setState(() {
      data[categoryId]!.removeAt(index);
    });
  }

  void updateItem(String categoryId, int index) async {
    // Show dialog with current data
    Map<String, dynamic> item = data[categoryId]![index];
    TextEditingController titleController =
        TextEditingController(text: item['title']);
    TextEditingController descriptionController =
        TextEditingController(text: item['description']);
    TextEditingController priceController =
        TextEditingController(text: item['price']);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  // Update data
                  data[categoryId]![index]['title'] = titleController.text;
                  data[categoryId]![index]['description'] =
                      descriptionController.text;
                  data[categoryId]![index]['price'] = priceController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void addProduct() async {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController priceController = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  // Add new product
                  String category = data.keys.first;
                  if (data.containsKey(category)) {
                    data[category]!.add({
                      'title': titleController.text,
                      'description': descriptionController.text,
                      'price': priceController.text,
                    });
                  } else {
                    data[category] = [
                      {
                        'title': titleController.text,
                        'description': descriptionController.text,
                        'price': priceController.text,
                      }
                    ];
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addProduct,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          String category = data.keys.elementAt(index);
          List<dynamic> products = data[category] ?? [];

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  category,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> product = products[index];
                    return Container(
                      height: MediaQuery.of(context).size.height * .14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppTheme.lightAppColors.bordercolor,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: context.screenHeight * 0.01,
                            horizontal: context.screenWidth * 0.03),
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                  onPressed: () {
                                    deleteItem(category, index);
                                  },
                                  icon: Icon(Icons.delete),
                                )),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  onPressed: () {
                                    updateItem(category, index);
                                  },
                                  icon: Icon(Icons.edit),
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MaintenanceText.orderMainText(shortenText(
                                      product['title'],
                                    )),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .01,
                                    ),
                                    Row(
                                      children: [
                                        const Image(
                                            image: AssetImage(
                                                'assets/images/Ellipse.png')),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .03,
                                        ),
                                        MaintenanceText.orderSecText(
                                            shortenText(
                                          product['description'],
                                        ))
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                    ),
                                    MaintenanceText.orderPriceText(
                                      product['price'],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          );
        },
      ),
    );
  }
}
