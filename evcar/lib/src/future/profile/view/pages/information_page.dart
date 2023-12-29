import 'package:evcar/src/future/charging_station/view/widget/detail_appbar.dart';
import 'package:flutter/material.dart';

import '../widget/information_widget.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: detailAppBar(
          'المعلومات الشخصية',
        ),
        body: const InformationWidget(),
      ),
    );
  }
}
