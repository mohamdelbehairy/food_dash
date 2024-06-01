import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/auth/logic/email/email_register/email_register_cubit.dart';
import '../../../../core/utils/logic/shared_pref/shared_pref_cubit.dart';
import '../../../../core/utils/logic/user_data_setting/user_data_setting_cubit.dart';
import '../../../user_data/logic/store_user_data/store_user_data_cubit.dart';
import '../../logic/google_auth/google_auth_cubit.dart';
import '../widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var storeUserData = context.read<StoreUserDataCubit>();
    var isUserData = context.read<UserDataSettingCubit>();
    var isLoading = context.read<GoogleAuthCubit>();
    var setSharedPref = context.read<SharedPrefCubit>();

    return BlocProvider(
        create: (context) => EmailRegisterCubit(),
        child: RegisterrViewBody(
            isUserData: isUserData,
            storeUserData: storeUserData,
            isLoading: isLoading,
            setSharedPref: setSharedPref,
            size: size));
  }
}

