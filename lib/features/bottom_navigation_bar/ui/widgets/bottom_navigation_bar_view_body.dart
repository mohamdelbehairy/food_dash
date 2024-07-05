import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/bottom_navigation_bar/bloc/navigation/navigation_cubit.dart';
import 'package:food_dash/features/bottom_navigation_bar/bloc/navigation/navigation_state.dart';
import 'custom_bottom_navigation_bar.dart';

class BottomNavigationBarViewBody extends StatefulWidget {
  const BottomNavigationBarViewBody({super.key});

  @override
  State<BottomNavigationBarViewBody> createState() =>
      _BottomNavigationBarViewBodyState();
}

class _BottomNavigationBarViewBodyState
    extends State<BottomNavigationBarViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NavigationCubit(),
      child: BlocConsumer<NavigationCubit, NavigationState>(
        listener: (BuildContext context, NavigationState state) {},
        builder: (context, state) {
          NavigationCubit navigationCubitInstance =
              NavigationCubit.get(context);
          return Scaffold(
            // backgroundColor: Colors.transparent,
            body: Center(
                child: navigationCubitInstance
                    .screens[navigationCubitInstance.currentIndex]),
            bottomNavigationBar: Theme(
              data: ThemeData(canvasColor: Color(0xfffffefe)),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: CustomBottomNavigationBar(
                    currentIndex: navigationCubitInstance.currentIndex,
                    onTap: (index) {
                      navigationCubitInstance.currentIndex = index;
                      navigationCubitInstance
                          .changeIndex(navigationCubitInstance.currentIndex);
                    }),
              ),
            ),
          );
        },
      ),
    );
  }
}
