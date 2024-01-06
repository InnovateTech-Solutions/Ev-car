import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/favorite/widget/widget_collection/favoriteproduct.dart';
import 'package:evcar/src/feature/favorite/widget/widget_collection/no_favoriteProducts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorite {
  static favoriteText(String title) {
    Text(title,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: AppTheme.lightAppColors.mainTextcolor,
            fontSize: 14,
          ),
        ));
  }

  static NoFavoirteProduct noFavoirteProduct() {
    return const NoFavoirteProduct();
  }

  static FavoirteProduct favoirteProduct() {
    return const FavoirteProduct();
  }
}
