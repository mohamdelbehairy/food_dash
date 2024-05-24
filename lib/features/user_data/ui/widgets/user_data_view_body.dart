import 'package:flutter/material.dart';
import 'user_data_view_section.dart';

class UserDataViewBody extends StatelessWidget {
  const UserDataViewBody({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: UserDataViewSection(size: size),
      ),
    );
  }
}

