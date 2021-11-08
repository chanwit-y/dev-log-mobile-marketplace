import 'package:flutter/material.dart';
import 'package:mobile_marketplace/app/constans/app_constants.dart';

class SearchField extends StatelessWidget {
  final controller = TextEditingController();
  final Function(String value)? onSearch;

  SearchField({this.onSearch, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kBorderRadius),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(Icons.search),
          hintText: "what are you looking for",
        ),
        textInputAction: TextInputAction.search,
        style: TextStyle(
          color: Colors.grey[800],
        ),
        onEditingComplete: () {
          FocusScope.of(context).unfocus();
          if (onSearch != null) onSearch!(controller.text);
        });
  }
}
