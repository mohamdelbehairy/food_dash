import 'package:flutter/material.dart';

void customSnackBarItem(BuildContext context, Widget content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: content));
}
