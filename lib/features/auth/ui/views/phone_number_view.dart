import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/remember_me/remember_me_cubit.dart';
import '../widgets/app_bar_auth.dart';
import '../widgets/phone_number_view_body.dart';

class PhoneNumberView extends StatelessWidget {
  const PhoneNumberView({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var isClick = context.read<RememberMeCubit>();
    return Scaffold(
        appBar: authAppBar(context, isClick),
        body: PhoneNumberViewBody(size: size, text: text));
  }



}
