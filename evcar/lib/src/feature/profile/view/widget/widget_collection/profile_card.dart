import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/information_page/controller/profile_controller.dart';
import 'package:evcar/src/feature/profile/view/widget/text_widget/text_widget.dart';
import 'package:evcar/src/feature/register/controller/user_register_controller.dart';
import 'package:evcar/src/feature/register/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileCardWidget extends StatefulWidget {
  const ProfileCardWidget({required this.token, super.key});
  final String token;
  @override
  State<ProfileCardWidget> createState() => _ProfileCardWidgetState();
}

class _ProfileCardWidgetState extends State<ProfileCardWidget> {
  final controlle = Get.put(ProfileController());

  final register = Get.put(UserRegisterController());

  late Future<UserModel> userDetails;

  @override
  void initState() {
    super.initState();
    userDetails = controlle.getUserDetails(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: userDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .12,
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .06,
                    vertical: MediaQuery.of(context).size.height * .02,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffDFDFDF),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width * .04),
                    child: Row(
                      children: [
                        Container(
                          width: context.screenWidth * 0.2,
                          height: context.screenHeight * 0.1,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: context.screenWidth * 0.005,
                                  color: AppTheme.lightAppColors.bordercolor),
                              shape: BoxShape.circle,
                              color: AppTheme.lightAppColors.background),
                          child: Center(
                            child: Icon(
                              Icons.person_2_outlined,
                              size: context.screenWidth * 0.15,
                              color: AppTheme.lightAppColors.bordercolor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Styles.textstyle19(snapshot.data!.username),
                            Styles.textstyle12('معلومات الحساب'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Text('Error: ${snapshot.error}');
            }
          } else {
            return CircularProgressIndicator(
                color: AppTheme.lightAppColors.bordercolor);
          }
        });
  }
}
