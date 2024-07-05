class BottomNavigationBarModel {
  final String label, image;
  final int index, currentIndex;
  final double itemHight;

  BottomNavigationBarModel(
      {required this.label,
      required this.image,
      required this.index,
      required this.currentIndex,
      this.itemHight = 24});
}
