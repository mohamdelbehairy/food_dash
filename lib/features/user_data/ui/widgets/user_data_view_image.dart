import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserDataViewCustomImage extends StatelessWidget {
  const UserDataViewCustomImage({super.key, required this.image});
  final XFile? image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 70,
        backgroundImage: image != null
            ? FileImage(File(image!.path)) as ImageProvider
            : NetworkImage(
                'https://t4.ftcdn.net/jpg/04/10/43/77/360_F_410437733_hdq4Q3QOH9uwh0mcqAhRFzOKfrCR24Ta.jpg'));
  }
}
