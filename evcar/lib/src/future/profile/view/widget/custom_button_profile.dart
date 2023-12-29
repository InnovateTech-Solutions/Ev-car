import 'package:evcar/src/future/profile/view/widget/dividerHorizontal.dart';
import 'package:evcar/src/future/profile/view/widget/text_widget.dart';
import 'package:flutter/material.dart';

class CustomButtonProfile extends StatelessWidget {
  const CustomButtonProfile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * .01),
          child: MaterialButton(
            onPressed: onTap,
            child: Row(
              children: [
                Icon(icon),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                Styles.textstyle18(title),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
        const MyDividerHorizontal(),
      ],
    );
  }
}
