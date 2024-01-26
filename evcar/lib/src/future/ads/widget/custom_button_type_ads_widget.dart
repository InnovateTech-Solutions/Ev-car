import 'package:flutter/material.dart';
import '../../../core/widget/text_widget/text_widget.dart';

class CustomBottunTypeAdsWidget extends StatelessWidget {
  const CustomBottunTypeAdsWidget({super.key, required this.text, this.onTap});

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * .08,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(218, 218, 218, 1),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .04,
            right: MediaQuery.of(context).size.width * .04,
          ),
          child: Row(
            children: [
              Styles.textstyle17normal(text, Colors.black),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
