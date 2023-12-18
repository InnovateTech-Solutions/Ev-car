import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/future/google_map/controller/google_map_controller.dart';
import 'package:evcar/src/future/google_map/view/widget/google_map_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({required this.search, Key? key}) : super(key: key);
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
              bottom: 0.005 * screenWidth,
            ),
          ),
        ),
        child: SizedBox(
          height: 0.1 * screenWidth,
          child: TextFormField(
              onTap: () {
                controller.isExpanded.value = true;
              },
              style: GoogleFonts.cairo(
                textStyle:
                    TextStyle(color: AppTheme.lightAppColors.subTextcolor),
              ),
              readOnly: !controller.isExpanded.value,
              cursorColor: AppTheme.lightAppColors.primary,
              keyboardType: widget.search.type,
              onChanged: widget.search.onChange,
              controller: widget.search.searchController,
              decoration: InputDecoration(
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

class SearchFullScreenWidget extends StatelessWidget {
  final SearchFormEntitiy search;

  const SearchFullScreenWidget({super.key, required this.search});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapController());

    return GestureDetector(
      onTap: () {
        controller.isExpanded.toggle();
      },
      child: Column(
        children: [
          TextFormField(
            onTap: () {
              controller.isExpanded.value = true;
            },
            style: GoogleFonts.cairo(
              textStyle: TextStyle(color: AppTheme.lightAppColors.subTextcolor),
            ),
            cursorColor: AppTheme.lightAppColors.primary,
            keyboardType: search.type,
            onChanged: search.onChange,
            controller: search.searchController,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              floatingLabelStyle:
                  TextStyle(color: AppTheme.lightAppColors.mainTextcolor),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[200]!,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[200]!),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              hintText: search.hintText,
              hintStyle: hintTextStyle(),
              hintTextDirection: TextDirection.rtl,
            ),
          ),
          // Add any other widgets or functionality you need for the full-screen search
        ],
      ),
    );
  }
}
