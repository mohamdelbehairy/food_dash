import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/bottom_navigation_bar/bloc/navigation/navigation_state.dart';
import 'package:food_dash/features/e_wallet/ui/views/e_wallet.dart';
import 'package:food_dash/features/homePage/ui/views/home_page.dart';
import 'package:food_dash/features/message/ui/views/message_page.dart';
import 'package:food_dash/features/orders/ui/views/order_page.dart';
import 'package:food_dash/features/profile/ui/views/profile.dart';


class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NaviagtionInitial());
  static NavigationCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List views = [
    Icon(Icons.home),
    Icon(Icons.collections),
    Icon(Icons.message),
    Icon(Icons.wallet),
    Icon(Icons.person),
  ];
  List<Widget> screens = [
    HomePage(),
    OrderPage(),
    MessagePage(),
    EWalletPage(),
    ProfilePage(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }
}
