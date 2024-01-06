import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/google_map/view/widget/google_map_widget.dart';
import 'package:flutter/material.dart';

class GoogleMapPage extends StatelessWidget {
  const GoogleMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.lightAppColors.primary,
        body: const Center(
          child: GoogleMapWidget(),
        ),
      ),
    );
  }
}
