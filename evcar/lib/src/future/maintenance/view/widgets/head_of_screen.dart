import 'package:flutter/material.dart';

class HeadOfScreen extends StatelessWidget {
  const HeadOfScreen({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .30,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01,
                vertical: MediaQuery.of(context).size.height * 0.01),
            child: InkWell(
              onTap: () {},
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 20,
                child: Image(
                  image: AssetImage('assets/images/heart_faver.png'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
