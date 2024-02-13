import 'dart:convert';

import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/ads/controller/ads_constroller.dart';
import 'package:evcar/src/feature/ads/view/widget/text/ads_text.dart';
import 'package:evcar/src/feature/ads/view/widget/widget_collection/dropdown_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TypeWidget extends StatefulWidget {
  const TypeWidget({super.key});

  @override
  State<TypeWidget> createState() => _TypeWidgetState();
}

class _TypeWidgetState extends State<TypeWidget> {
  List<Map<String, dynamic>> _data = [];
  String? _selectedItem;
  final controller = Get.put(AdsController());
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://adventurous-yak-pajamas.cyclic.app/typeOfProducts/getAllTypeOfProducts'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          _data = List<Map<String, dynamic>>.from(responseData);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.03,
          vertical: context.screenHeight * 0.04),
      width: context.screenWidth,
      height: context.screenHeight * 0.2,
      decoration: BoxDecoration(
          color: AppTheme.lightAppColors.background,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AdsText.secText("النوع"),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          TypeDropDownMenuWidget(
            value: _selectedItem,
            data: _data.map((item) {
              return DropdownMenuItem<String>(
                value: item['title'],
                child: Text(item['title']),
              );
            }).toList(),
            onChange: (String? newValue) {
              final selectedItem =
                  _data.firstWhere((element) => element['title'] == newValue);
              setState(() {
                _selectedItem = newValue;
                controller.TypeValue.text = selectedItem['_id'];
              });

              print(selectedItem['_id']);
            },
          )
        ],
      ),
    );
  }
}
