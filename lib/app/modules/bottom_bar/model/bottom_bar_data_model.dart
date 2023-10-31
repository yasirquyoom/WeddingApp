class BottomBarDataModel {
  String imagePath;
  int index;
  bool isSelected;
  BottomBarDataModel(
      {required this.isSelected, required this.index, required this.imagePath});
}

class TabBarModel {
  String name;
  int index;
  TabBarModel({required this.name, required this.index});
}
