import 'package:flutter/material.dart';

class CustemTextDetails extends StatelessWidget {
  const CustemTextDetails({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          maxLines: 2,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 13,
            fontFamily: 'cairo-Medium',
          ),
        ),
        InkWell(
          onTap: () {},
          child: const Text(
            'مزيد ...',
            style: TextStyle(
              color: Colors.blue,
              fontFamily: 'cairo-Medium',
            ),
          ),
        ),
      ],
    );
  }
}
