import 'package:flutter/material.dart';

class MyDividerHorizontal extends StatelessWidget {
  const MyDividerHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * .89,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );
  }
}
