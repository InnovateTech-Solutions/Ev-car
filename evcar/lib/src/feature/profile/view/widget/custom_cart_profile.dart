import 'package:evcar/src/feature/profile/controller/profile_controller.dart';
import 'package:evcar/src/feature/profile/view/widget/text_widget.dart';
import 'package:evcar/src/feature/register/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCartProfile extends StatefulWidget {
  const CustomCartProfile({super.key});

  @override
  State<CustomCartProfile> createState() => _CustomCartProfileState();
}

class _CustomCartProfileState extends State<CustomCartProfile> {
  final controlle = Get.put(ProfileController());
  late Future<UserModel> userDetails;

  @override
  void initState() {
    super.initState();
    userDetails = controlle.getUserDetails();
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
                        const CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              AssetImage('assets/images/profile.png'),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
            return const CircularProgressIndicator();
          }
        });
  }
}
