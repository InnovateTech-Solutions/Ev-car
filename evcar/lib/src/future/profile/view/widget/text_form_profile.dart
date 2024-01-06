import 'package:flutter/material.dart';

class TextFormProfile extends StatelessWidget {
  const TextFormProfile({super.key, required this.label, required this.textController});

  final String label;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color.fromRGBO(142, 142, 147, 1),
              fontSize: 15,
              fontFamily: 'cairo-Medium',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(142, 142, 147, 1),
              ),
              borderRadius: BorderRadius.circular(10),
            
            )),
            controller: textController,
            readOnly: true,
            
          ),
        ],
      ),
    );
  }
}
