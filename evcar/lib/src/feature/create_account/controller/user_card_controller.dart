import 'package:evcar/src/config/routes/routes.dart';
import 'package:evcar/src/feature/create_account/create_account/model/user_card_model.dart';
import 'package:evcar/src/feature/vendor_account/view/page/vendor_register.dart';
import 'package:get/get.dart';

class UserCardController extends GetxController {
  List<UserCardModel> userCards = [
    UserCardModel(
      title: ' حساب شخصي ',
      description:
          'تستطيع الوصول لجميع الخدمات بشكل مجاني والقدرة \nعلى تقديم خدمات الصيانة وبيع القطع والسيارات الكهربائية',
      image: 'assets/images/untitled (2).png',
      voidCallback: () => Get.toNamed(AppRoutes.register),
    ),
    UserCardModel(
        title: 'مركز صيانة',
        description:
            'تستطيع الوصول لجميع الخدمات بشكل مجاني والقدرة \nعلى تقديم خدمات الصيانة وبيع القطع والسيارات الكهربائية',
        image: 'assets/images/untitled.png',
        voidCallback: () => Get.to(VendorRegisterPage(
              type: 'Technician',
            ))),
    UserCardModel(
      title: 'فني صيانة',
      description:
          'تستطيع الوصول لجميع الخدمات بشكل مجاني والقدرة \nعلى تقديم خدمات الصيانة وبيع القطع والسيارات الكهربائية',
      image: 'assets/images/untitled (5).png',
      voidCallback: () => Get.to(VendorRegisterPage(
        type: 'Person',
      )),
    ),

    // UserCardModel(
    //     title: 'معرض سيارت',
    //     description:
    //         'تستطيع الوصول لجميع الخدمات بشكل مجاني والقدرة \nعلى تقديم خدمات الصيانة وبيع القطع والسيارات الكهربائية',
    //     image: 'assets/images/untitled (5).png')
  ];
}