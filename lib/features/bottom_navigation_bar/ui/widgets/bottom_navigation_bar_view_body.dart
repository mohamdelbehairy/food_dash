import 'package:flutter/material.dart';
import 'custom_bottom_navigation_bar.dart';

class BottomNavigationBarViewBody extends StatefulWidget {
  const BottomNavigationBarViewBody({super.key});

  @override
  State<BottomNavigationBarViewBody> createState() =>
      _BottomNavigationBarViewBodyState();
}

class _BottomNavigationBarViewBodyState
    extends State<BottomNavigationBarViewBody> {
  int _currentIndex = 0;
  List views = [
    Icon(Icons.home),
    Icon(Icons.collections),
    Icon(Icons.message),
    Icon(Icons.wallet),
    Icon(Icons.person),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(child: views[_currentIndex]),
      bottomNavigationBar: Theme(
        data: ThemeData(canvasColor: Color(0xfffffefe)),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: CustomBottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              }),
        ),
      ),
    );
  }
}
