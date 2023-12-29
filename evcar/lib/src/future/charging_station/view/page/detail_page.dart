import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/future/charging_station/model/detail_model.dart';
import 'package:evcar/src/future/charging_station/view/widget/detail_widget.dart';
import 'package:flutter/material.dart';

import '../widget/detail_appbar.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.detailModel});
  final ChargingStationModel detailModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: detailAppBar("محطة الشحن "),
        backgroundColor: AppTheme.lightAppColors.background,
        body: DetailWidget(
          detailModel: detailModel,
        ),
      ),
    );
  }
}
