import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/bottom_navigation_bar/logic/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:food_dash/features/bottom_navigation_bar/logic/bottom_navigation/bottom_navigation_state.dart';
import 'custom_bottom_navigation_bar.dart';

class BottomNavigationBarViewBody extends StatelessWidget {
  const BottomNavigationBarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        BottomNavigationCubit navigationCubitInstance =
            BottomNavigationCubit.get(context);
        return Scaffold(
          body: Center(
              child: navigationCubitInstance
                  .screens[navigationCubitInstance.currentIndex]),
          bottomNavigationBar: Theme(
            data: ThemeData(canvasColor: Color(0xfffffefe)),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
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
    );
  }
}
