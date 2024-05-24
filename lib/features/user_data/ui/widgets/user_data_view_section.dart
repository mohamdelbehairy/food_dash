import 'package:flutter/material.dart';
import 'user_data_view_component.dart';

class UserDataViewSection extends StatefulWidget {
  const UserDataViewSection({super.key, required this.size});

  final Size size;

  @override
  State<UserDataViewSection> createState() => _UserDataViewSectionState();
}

class _UserDataViewSectionState extends State<UserDataViewSection> {
  TextEditingController fullName = TextEditingController();
  TextEditingController nickName = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController gender = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey();

  @override
  void dispose() {
    fullName.dispose();
    nickName.dispose();
    dateOfBirth.dispose();
    email.dispose();
    phoneNumber.dispose();
    gender.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: globalKey,
        child: UserDataViewComponenet(
            size: widget.size,
            fullName: fullName,
            nickName: nickName,
            dateOfBirth: dateOfBirth,
            email: email,
            phoneNumber: phoneNumber,
            gender: gender,
            globalKey: globalKey));
  }
}
