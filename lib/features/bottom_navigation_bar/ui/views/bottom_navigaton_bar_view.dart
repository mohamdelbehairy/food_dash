import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/bottom_navigation/bottom_navigation_cubit.dart';
import '../widgets/bottom_navigation_bar_view_body.dart';

class BottomNavigationBarView extends StatelessWidget {
  const BottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationCubit(),
      child: BottomNavigationBarViewBody(),
    );
  }
}
