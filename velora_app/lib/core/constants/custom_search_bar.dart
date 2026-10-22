import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search_outlined, color: Color(0xff514440)),
        hintText: "Search rings,silk scarves,.....",
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xff837470),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        fillColor: Color(0xffF6F2F7),
        filled: true,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(Icons.qr_code_scanner, color: Color(0xff514440)),
        ),
      ),
    );
  }
}
