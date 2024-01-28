import 'package:flutter/material.dart';

class CategoryModel {
  final String title;
  final Widget widget;
  final VoidCallback onTap;

  CategoryModel(
      {required this.widget, required this.title, required this.onTap});
}
