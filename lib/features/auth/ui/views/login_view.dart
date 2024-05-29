import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/utils/logic/is_user_data/is_user_data_cubit.dart';
import 'package:food_dash/features/auth/logic/email/email_login/email_login_cubit.dart';
import 'package:food_dash/features/auth/logic/remember_me/remember_me_cubit.dart';
import 'package:food_dash/features/auth/logic/user_shared_pref/user_shared_pref_cubit.dart';
import 'package:food_dash/features/auth/ui/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (constext) => EmailLoginCubit()),
        BlocProvider(create: (constext) => IsUserDataCubit()),
        BlocProvider(create: (context) => RememberMeCubit()),
        BlocProvider(create: (context) => UserSharedPrefCubit())
      ],
      child: Scaffold(
        appBar: AppBar(),
        body: LoginvViewBody(size: size),
      ),
    );
  }
}
