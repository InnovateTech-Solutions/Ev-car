import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/google_map/controller/google_map_controller.dart';
import 'package:evcar/src/feature/google_map/view/widget/text/google_map_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({required this.search, super.key});
  final SearchFormEntitiy search;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(MapController());

    return Center(
      child: Theme(
        data: Theme.of(context).copyWith(
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: AppTheme.lightAppColors.primary,
            contentPadding: EdgeInsets.only(
              bottom: 0.008 * screenWidth,
            ),
          ),
        ),
        child: SizedBox(
          height: 0.1 * screenWidth,
          child: TextFormField(
              onTap: () {
                controller.isExpanded.value = true;
              },
              style: TextStyle(
                  color: AppTheme.lightAppColors.mainTextcolor,
                  fontFamily: 'cairo-Regular'),
              readOnly: !controller.isExpanded.value,
              cursorColor: AppTheme.lightAppColors.background,
              keyboardType: widget.search.type,
              onChanged: widget.search.onChange,
              controller: widget.search.searchController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                floatingLabelStyle:
                    TextStyle(color: AppTheme.lightAppColors.mainTextcolor),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[200]!,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[200]!),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                hintText: widget.search.hintText,
                hintStyle: hintTextStyle(),
                hintTextDirection: TextDirection.rtl,
              )),
        ),
      ),
    );
  }
}

class SearchFormEntitiy {
  TextEditingController? searchController = TextEditingController();
  String hintText;

  TextInputType type;
  void Function(String?)? onChange;

  SearchFormEntitiy({
    this.searchController,
    required this.hintText,
    required this.type,
    required this.onChange,
  });
}
