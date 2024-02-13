import 'dart:convert';
import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/login/controller/login_controller.dart';
import 'package:evcar/src/feature/register/controller/user_register_controller.dart';
import 'package:evcar/src/feature/services/controller/vendor_services_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(SelectServiceWidget(
    token:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJudW1iZXIiOiI5NjI3Nzc1NTM1NTQiLCJ0eXBlIjoic3RvcmUiLCJpYXQiOjE3MDc4NDU1NDksImV4cCI6MTcwODQ1MDM0OX0.xCgiwA5CvlqNzYRCDSYLl6SVj3PovAH5Xt7bXsslynE',
  ));
}

class ServiceModel {
  final String id;
  final String name;

  ServiceModel({required this.id, required this.name});

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['_id'],
      name: json['title'],
    );
  }
}

class CombinedServiceModel {
  final String id;
  final String name;
  final bool existsInBoth;

  CombinedServiceModel(
      {required this.id, required this.name, required this.existsInBoth});
}

class SelectServiceWidget extends StatefulWidget {
  final String token;

  SelectServiceWidget({required this.token, super.key});

  @override
  _SelectServiceWidgetState createState() => _SelectServiceWidgetState();
}

class _SelectServiceWidgetState extends State<SelectServiceWidget> {
  final controller = Get.put(SelectServiceController());

  final registerToken = Get.put(UserRegisterController());

  final loginToken = Get.put(LoginController());

  @override
  void initState() {
    controller.getVendorServiceDetails(widget.token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SelectService(); // UniqueKey() will ensure the widget is recreated
  }

  Obx SelectService() {
    return Obx(() {
      return ListView.builder(
        itemCount: controller.combinedList.length,
        itemBuilder: (context, index) {
          final startIndex = index * 3;
          return Row(
              children: List.generate(3, (index) {
            if (startIndex + index < controller.combinedList.length) {
              return ComianedContainer(
                service: controller.combinedList[startIndex + index],
                callback: () {
                  controller.toggleServiceId(
                      controller.combinedList[startIndex + index].id);
                },
              );
            } else {
              return Expanded(child: SizedBox.shrink());
            }
          }));
        },
      );
    });
  }
}

class SelectServiceController extends GetxController {
  SelectServiceController();
  final serviceList = <ServiceModel>[].obs;
  final serviceID = <String>[].obs;
  final combinedList = <CombinedServiceModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllTagsData();
    // Replace "token" with actual token
  }

  Future<void> fetchAllTagsData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://adventurous-yak-pajamas.cyclic.app/tags/getalltags'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        serviceList.value =
            data.map((item) => ServiceModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future<void> getVendorServiceDetails(String token) async {
    final response = await http.get(
      Uri.parse(
          'https://adventurous-yak-pajamas.cyclic.app/vendors/getVendorDetails'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      List<String> tags = List<String>.from(responseData['tags']);
      serviceID.value = tags;
      combinedList.value = combineLists();
    } else {
      throw Exception('Failed to load user details');
    }
  }

  List<CombinedServiceModel> combineLists() {
    List<CombinedServiceModel> combinedList = [];

    for (ServiceModel service in serviceList) {
      bool existsInBoth = serviceID.contains(service.id);
      combinedList.add(CombinedServiceModel(
        id: service.id,
        name: service.name,
        existsInBoth: existsInBoth,
      ));
    }

    return combinedList;
  }

  void toggleServiceId(String id) {
    if (serviceID.contains(id)) {
      serviceID.remove(id);
    } else {
      serviceID.add(id);
    }
    print(serviceID);
    combinedList.value = combineLists();
  }
}

class ComianedContainer extends StatelessWidget {
  const ComianedContainer(
      {required this.service, required this.callback, super.key});
  final CombinedServiceModel service;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: context.screenHeight * 0.07,
        width: context.screenWidth * 0.3,
        decoration: BoxDecoration(
            color: service.existsInBoth
                ? AppTheme.lightAppColors.buttoncolor
                : AppTheme.lightAppColors.mainTextcolor,
            border: Border.all(color: AppTheme.lightAppColors.buttoncolor),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(
            child: Text(
          service.name,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            fontFamily: 'cairo-Regular',
            color: service.existsInBoth
                ? AppTheme.lightAppColors.mainTextcolor
                : AppTheme.lightAppColors.buttoncolor,
          ),
        )),
      ),
    );
  }
}
