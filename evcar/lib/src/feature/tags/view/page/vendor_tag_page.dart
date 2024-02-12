import 'package:evcar/src/feature/charging_station/view/widget/detail_appbar.dart';
import 'package:evcar/src/feature/tags/view/widget/vendor_tag_widget.dart';
import 'package:flutter/material.dart';

class VendorTagsPage extends StatelessWidget {
  const VendorTagsPage({super.key, required this.id, required this.title});
  final String id;
  final String title;
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: detailAppBar(title),
        body: VendorTagsWidget(
          id: id,
        ),
      ),
    );
  }
}
