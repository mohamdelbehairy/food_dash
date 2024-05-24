import 'package:flutter/material.dart';

class BottomSheetItemModel {
  final String text;
  final IconData icon;
  final Function() onTap;

  BottomSheetItemModel(
      {required this.text, required this.icon, required this.onTap});
}
