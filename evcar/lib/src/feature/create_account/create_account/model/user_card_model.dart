import 'package:flutter/material.dart';

class UserCardModel {
  final String image;
  final String description;
  final String title;
  final VoidCallback voidCallback;

  UserCardModel(
      {required this.title,
      required this.description,
      required this.image,
      required this.voidCallback});
}
