import 'package:evcar/src/feature/charging_station/view/widget/detail_appbar.dart';
import 'package:evcar/src/feature/product/widget/main_widget/all_product_widget.dart';
import 'package:flutter/material.dart';

class AllPeoductPage extends StatelessWidget {
  const AllPeoductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: detailAppBar("All Product"),
      body: Center(
        child: AllProductWidget(),
      ),
    ));
  }
}
