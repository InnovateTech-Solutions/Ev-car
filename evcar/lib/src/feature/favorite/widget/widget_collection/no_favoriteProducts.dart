// ignore_for_file: file_names

import 'package:evcar/src/feature/favorite/widget/main_widgets/favorite_content.dart';
import 'package:flutter/material.dart';

class NoFavoirteProduct extends StatelessWidget {
  const NoFavoirteProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Favorite.favoriteText('No favorite products yet.'),
    );
  }
}
