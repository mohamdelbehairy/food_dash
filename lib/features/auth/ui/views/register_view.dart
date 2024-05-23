import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/auth/logic/email/email_register/email_register_cubit.dart';
import '../widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return BlocProvider(
      create: (context) => EmailRegisterCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: RegisterViewBody(size: size),
      ),
    );
  }
}
