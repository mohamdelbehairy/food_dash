import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/custom_app_bar.dart';
import '../../logic/remember_me/remember_me_cubit.dart';
import '../widgets/opt_phone_number_view_body.dart';

class OptPhoneNumberView extends StatelessWidget {
  const OptPhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var isClick = context.read<RememberMeCubit>();
    return Scaffold(
        appBar: customAppbar(appBarText: 'OPT Code Verification'),
        body: OptPhoneNumberViewBody(size: size, isClick: isClick));
  }
}
