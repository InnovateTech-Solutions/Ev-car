import 'package:flutter/material.dart';

import '../../../../core/widget/text_widget/text_widget.dart';

class CustomTextLocation extends StatelessWidget {
  const CustomTextLocation({super.key, required this.location});

  final String location;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on,
          color: Color.fromRGBO(186, 92, 61, 1),
          size: 12,
        ),
        Styles.location(location),
      ],
    );
  }
}
