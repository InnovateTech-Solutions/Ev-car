import 'package:flutter/material.dart';
import '../widget/car_show_widget.dart';

class CarShowPage extends StatelessWidget {
  const CarShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CarShowWidget(),
    );
  }
}
