import 'package:flutter/material.dart';

class ModalProgressModel {
  final bool inAsyncCall;
  Offset? offset;
  final Color modalprogressColor;
  Color? progressIndicatorColor;
  final double opacity;
  final Widget child;

  ModalProgressModel(
      {required this.inAsyncCall,
      this.modalprogressColor = Colors.grey,
      this.progressIndicatorColor,
      this.offset,
      this.opacity = 0.3,
      required this.child});
}
