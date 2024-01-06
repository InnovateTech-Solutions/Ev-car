import 'package:evcar/src/feature/favorite/controller/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoirteProduct extends GetView<FavoriteController> {
  const FavoirteProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: controller.favoriteProducts.length,
          itemBuilder: (context, index) {
            // return Card(
            //     elevation: 3,
            //     child: ListTile(
            //         title: chargin(controller.favoriteProducts[index]),
            //         trailing: IconButton(
            //           icon: const Icon(Icons.delete),
            //           onPressed: () {
            //             controller
            //                 .toggleService(controller.favoriteProducts[index]);
            //           },
            //         )));
          },
        )
      ],
    );
  }
}
