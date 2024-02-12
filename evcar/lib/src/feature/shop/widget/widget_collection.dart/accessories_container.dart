import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/product/model/parts_model.dart';
import 'package:evcar/src/feature/product/view/product_page.dart';
import 'package:evcar/src/feature/product/widget/text/product_text.dart';
import 'package:evcar/src/feature/product/widget/widget_collection/custem_button_call.dart';
import 'package:flutter/material.dart';

class accessoriesContainer extends StatelessWidget {
  const accessoriesContainer(
      {super.key, required this.product, required this.phone});
  final Product product;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductPage(
                    productId: product.id,
                  )),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
        decoration: BoxDecoration(
          color: AppTheme.lightAppColors.background,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .15,
              width: MediaQuery.of(context).size.width * .3,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: MediaQuery.of(context).size.height * .15,
                    width: MediaQuery.of(context).size.width * .3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppTheme.lightAppColors.background,
                      image: DecorationImage(
                        image: NetworkImage(
                          product.img.firstOrNull!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Image.network(
                      product.img.firstOrNull!,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .15,
              width: MediaQuery.of(context).size.width * .3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductText.similarMainText(product.title),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .005,
                  ),
                  ProductText.similarSecText(product.vendor),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .005,
                  ),
                  ProductText.similarThirdText(product.price + "دينار"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .005,
                  ),
                  CustemButtonCall(
                    text: 'اطلب الان',
                    phone: phone,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
