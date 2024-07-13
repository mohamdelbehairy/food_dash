class BottomNavigationBarModel {
  final String label, activeIcon, inActiveIcon;
  final int index, currentIndex;
  final double? activeItemHight, inActiveItemHight;

  BottomNavigationBarModel(
      {required this.label,
      required this.activeIcon,
      required this.inActiveIcon,
      required this.index,
      required this.currentIndex,
      this.activeItemHight,
      this.inActiveItemHight = 24});
}
