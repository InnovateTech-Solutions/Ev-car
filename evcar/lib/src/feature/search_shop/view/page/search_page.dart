import 'package:evcar/src/feature/search_shop/view/widget/search_widget.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SearchWidget(),
    ));
  }
}
