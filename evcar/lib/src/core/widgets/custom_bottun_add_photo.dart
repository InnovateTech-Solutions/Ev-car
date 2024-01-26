import 'package:flutter/material.dart';

class CustomAddPhotoBottun extends StatelessWidget {
  const CustomAddPhotoBottun({super.key, this.onTap, required this.image});

  final Function()? onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * .4,
        height: MediaQuery.of(context).size.height * .2,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color.fromRGBO(218, 218, 218, 1)),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(218, 218, 218, 1),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Image(
                image: AssetImage(image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
