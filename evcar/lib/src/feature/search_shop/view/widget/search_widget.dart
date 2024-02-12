import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/maintenance/widget/maintenance_partial/search/maintenance_search.dart';
import 'package:evcar/src/feature/product/model/product_detail_model.dart';
import 'package:evcar/src/feature/search_shop/controller/search_controller.dart';
import 'package:evcar/src/feature/search_shop/view/widget/search_ptoduct.dart';
import 'package:evcar/src/feature/search_shop/view/widget/search_vendor.dart';
import 'package:evcar/src/feature/vendor_account/model/vednor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchWidget extends StatefulWidget {
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this); // Change the length to 2
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final searchController = Get.put(SearchControllerr());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.close),
            ),
            Obx(() {
              switch (searchController.selectedTabIndex.value) {
                case 0:
                  return MaintenanceSearch(
                    search: SearchFormEntitiy(
                      hintText: "قطع, اكسسواات ...",
                      type: TextInputType.name,
                      onChange: (value) {
                        if (value!.isEmpty) {
                          searchController.product.clear();
                        } else {
                          searchController.searchForTab1(value);
                        }
                      },
                      enableText: false,
                      ontap: () {},
                    ),
                  );
                case 1:
                  return MaintenanceSearch(
                    search: SearchFormEntitiy(
                      hintText: "محلات صيانة",
                      type: TextInputType.name,
                      onChange: (value) {
                        if (value!.isEmpty) {
                          searchController.vendorsearch.clear();
                        } else {
                          searchController.searchForTab2(value);
                        }
                      },
                      enableText: false,
                      ontap: () {},
                    ),
                  );
                default:
                  return SizedBox();
              }
            }),
            TabBar(
              labelColor: AppTheme.lightAppColors.primary,
              indicatorColor: AppTheme.lightAppColors.buttoncolor,
              tabs: [
                Tab(text: "قطع, اكسسواات ..."),
                Tab(text: "محلات صيانة"),
              ],
              controller: _tabController,
              onTap: (index) {
                searchController.selectTab(index);
              },
            ),
            Obx(() {
              switch (searchController.selectedTabIndex.value) {
                case 0:
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(
                          height: context.screenHeight * 0.01,
                        ),
                        SizedBox(
                          height: context.screenHeight * 0.7,
                          child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            itemCount: searchController.product.length,
                            itemBuilder: (context, index) {
                              final product = searchController.product[index];
                              return SearchProductWidget(
                                partsModel: ProductDetails(
                                    id: product.id,
                                    title: product.title,
                                    images: product.images,
                                    description: product.description,
                                    price: product.price,
                                    typeOfProduct: product.typeOfProduct,
                                    vendor: product.vendor),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: context.screenHeight * 0.01,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                case 1:
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(
                          height: context.screenHeight * 0.01,
                        ),
                        SizedBox(
                          height: context.screenHeight * 0.73,
                          child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            itemCount: searchController.vendorsearch.length,
                            itemBuilder: (context, index) {
                              final vendor =
                                  searchController.vendorsearch[index];
                              return SearchVendorWidget(
                                  vendor: Vendor(
                                      id: vendor.id,
                                      title: vendor.title,
                                      subtitle: vendor.subtitle,
                                      img: vendor.img,
                                      address: vendor.address,
                                      number: vendor.number,
                                      commercialLicense:
                                          vendor.commercialLicense,
                                      password: vendor.password,
                                      type: vendor.type,
                                      tags: vendor.tags,
                                      description: vendor.description,
                                      status: vendor.status,
                                      rating: vendor.rating));
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: context.screenHeight * 0.01,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                default:
                  return SizedBox();
              }
            }),
          ],
        ),
      ),
    );
  }

  String shortenText(String text, {int maxLength = 15}) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }
}
