import 'package:flutter/material.dart';
import '../../../charge_station/view/widget/charge_station_appbar.dart';
import '../widget/profile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ChargeStationAppBar(
        title: 'الحساب الشخصي',
      ),
      body: ProfileWidget(),
    );
  }
}
