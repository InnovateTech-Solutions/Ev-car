import 'package:evcar/src/feature/charging_station/view/widget/detail_appbar.dart';
import 'package:evcar/src/feature/favourite_page/widget/favourite_widget.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: detailAppBar("المفضلة"),
        body: FavouriteWidget(),
      ),
    );
  }
}
