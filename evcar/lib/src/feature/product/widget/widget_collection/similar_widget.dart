// import 'package:evcar/src/config/sizes/sizes.dart';
// import 'package:evcar/src/config/theme/theme.dart';
// import 'package:evcar/src/feature/product/model/parts_model.dart';
// import 'package:evcar/src/feature/product/widget/widget_collection/similar_container.dart';
// import 'package:flutter/material.dart';

// class SimilarWidget extends StatelessWidget {
//   const SimilarWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: null,
//         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//           if (ConnectionState == ConnectionState.done) {
//             if (snapshot.hasData) {
//               List<Product> list = snapshot.data!;

//               return SizedBox(
//                 height: context.screenHeight * 0.33,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: list.length,
//                   // separatorBuilder: (BuildContext context, int index) {
//                   //   return SizedBox(
//                   //     width: context.screenWidth * 0.05,
//                   //   );
//                   // },
//                   itemBuilder: (BuildContext context, int index) {
//                     return Center(
//                         child: SimilarContainer(product: list[index]));
//                   },
//                 ),
//               );
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(
//                   color: AppTheme.lightAppColors.bordercolor,
//                 ),
//               );
//             }
//           } else {
//             return Center(
//               child: CircularProgressIndicator(
//                 color: AppTheme.lightAppColors.bordercolor,
//               ),
//             );
//           }
//         });
//   }
// }
