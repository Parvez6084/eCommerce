
import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
 final TextEditingController controller;

 const MySearchBar({required this.controller, super.key});

 @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
            labelText: 'Search',
            labelStyle: TextStyle(fontSize: 14),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            contentPadding: EdgeInsets.only(left: 16, right: 16),
            suffixIcon: Icon(Icons.search)
        ),
      ),
    );
  }
}
