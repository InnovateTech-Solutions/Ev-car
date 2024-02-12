import 'package:evcar/src/feature/charging_station/view/widget/detail_appbar.dart';
import 'package:evcar/src/feature/tags/view/widget/all_tags_widget.dart';
import 'package:flutter/material.dart';

class AllTagsPage extends StatelessWidget {
  const AllTagsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: detailAppBar("خدماتنا"),
        body: AllTagsWidget(),
      ),
    );
  }
}
