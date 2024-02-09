import 'package:evcar/src/feature/basic_info/view/widget/basic_info_appbar.dart';
import 'package:evcar/src/feature/offers/view/widget/offers_widget.dart';
import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: BasicInfoAppBar.appBar(), body: OfferWidget()),
    );
  }
}
