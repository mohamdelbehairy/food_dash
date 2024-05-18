import 'package:flutter/material.dart';

class ProviderAuthItemModel {
  final String itemText;
  final Widget itemWidget;
  final Function() onTap;

  ProviderAuthItemModel(
      {required this.itemText, required this.itemWidget,required this.onTap});
}
