import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/feature/maintenance/controller/maintenance_controller.dart';
import 'package:evcar/src/feature/maintenance/model/services_model.dart';
import 'package:evcar/src/feature/tags/view/page/vendor_tag_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllTagsWidget extends StatelessWidget {
  const AllTagsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MaintenanceController());

    return Container(
      margin: EdgeInsets.all(10),
      child: FutureBuilder(
        future: controller.fetchTags(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<ServicesModel> tags = snapshot.data!;
              return SizedBox(
                  width: context.screenWidth,
                  height: context.screenHeight,
                  child: GridView.builder(
                    itemCount: tags.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(VendorTagsPage(
                            id: tags[index].id,
                            title: tags[index].title,
                          ));
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromRGBO(
                                          215, 255, 255, 1),
                                    ),
                                    child: Image.network(tags[index].image),
                                  ),
                                  Text(
                                    tags[index].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Cairo-Bold',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ));
            } else {
              return Center();
            }
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
