import 'package:flutter/material.dart';

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
        Text(
          location,
          style: const TextStyle(
            color: Color.fromRGBO(186, 92, 61, 1),
            fontFamily: 'cairo-Medium',
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
