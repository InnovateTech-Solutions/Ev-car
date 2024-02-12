import 'package:evcar/src/feature/services/controller/vendor_services_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorServicePage extends StatelessWidget {
  final VendorServiceaController controller = Get.put(VendorServiceaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendor Services'),
      ),
      body: Obx(() {
        if (controller.serviceList1.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: controller.serviceList1.length,
            itemBuilder: (context, index) {
              final tag = controller.serviceList1[index];
              return ListTile(
                title: Text(tag.tag.name),
                tileColor: tag.exists ? Colors.green.withOpacity(0.2) : null,
                onTap: () {
                },
              );
            },
          );
        }
      }),
    );
  }
}
