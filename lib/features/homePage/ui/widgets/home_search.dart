import 'package:flutter/material.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: TextField(
        autofocus: false,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            filled: true,
            prefixIcon: Icon(Icons.search),
            hintText: 'what are you craving',
            fillColor: Color.fromARGB(245, 246, 245, 255),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
