import 'package:evcar/src/feature/vendor_map/view/widgets/vendor_map.dart';
import 'package:flutter/material.dart';

class VendorMapPage extends StatelessWidget {
  const VendorMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: MapWidget(),
    ));
  }
}
