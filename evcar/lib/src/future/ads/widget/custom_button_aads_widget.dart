import 'package:flutter/material.dart';
import '../../../core/widget/text_widget/text_widget.dart';

class CustomButtonAdsWidget extends StatelessWidget {
  const CustomButtonAdsWidget({
    super.key,
    this.text,
    required this.image,
    this.onTap,
  });

  final String? text;
  final String image;
  final Function()? onTap;

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
            Positioned(
              right: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * .02,
                  horizontal: MediaQuery.of(context).size.width * .02,
                ),
                child: const Image(
                  image: AssetImage('assets/images/zondicons_add-outline.png'),
                ),
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(image),
                  ),
                  Styles.textstyle14bold(
                      text ?? '', const Color.fromRGBO(0, 0, 0, 1)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
