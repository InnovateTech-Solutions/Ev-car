import 'package:evcar/src/future/charging_station/view/widget/detail_appbar.dart';
import 'package:flutter/material.dart';

import '../widget/profile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: detailAppBar(
          'الحساب الشخصي',
        ),
        body: ProfileWidget(),
      ),
    );
  }
}
