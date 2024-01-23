import 'package:evcar/src/config/theme/theme.dart';
import 'package:flutter/material.dart';

class MaintenanceSearch extends StatefulWidget {
  const MaintenanceSearch({required this.search, super.key});
  final SearchFormEntitiy search;

  @override
  State<MaintenanceSearch> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<MaintenanceSearch> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Theme(
        data: Theme.of(context).copyWith(
            inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[100],
        )),
        child: TextFormField(
            style: TextStyle(
              fontFamily: 'Cairo-Bold',
            ),
            cursorColor: Colors.grey[700],
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
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(
                Icons.filter_list,
                color: Colors.grey[900]!,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[200]!),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              prefixIconColor: Colors.grey[700],
              hintText: widget.search.hintText,
            )),
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
