import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChargeStationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ChargeStationAppBar({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(null),
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontFamily: 'cairo-SemiBold',
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
