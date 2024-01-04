import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'أبحث',
        hintStyle: const TextStyle(
          color: Color.fromRGBO(0, 0, 0, 0.3),
          fontFamily: 'cairo-Medium',
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: const Image(
          image: AssetImage('assets/images/searchiconmain.png'),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: const Image(
            image: AssetImage('assets/images/filtericon.png'),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color.fromRGBO(245, 245, 245, 1),
      ),
    );
  }
}
