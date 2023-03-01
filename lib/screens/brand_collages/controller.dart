import 'model.dart';

class BrandCollagesController {
  List<BrandCollageModel> list = [
    BrandCollageModel(
        collageImage:
            "https://i.pinimg.com/originals/83/ac/65/83ac658e8f5230248fba0db2a43260bc.jpg",
        collageTitle: "Hello1",
        createdAt: "01:15PM",
        userImage:
            "https://www.kevinashleyphotography.com/wp-content/uploads/2015/11/person.jpg",
        userName: "Ahmed Ali1"),
    BrandCollageModel(
        collageImage:
            "https://i.pinimg.com/originals/83/ac/65/83ac658e8f5230248fba0db2a43260bc.jpg",
        collageTitle: "Hello2",
        createdAt: "02:15PM",
        userImage:
            "https://www.kevinashleyphotography.com/wp-content/uploads/2015/11/person.jpg",
        userName: "Ahmed Ali2"),
    BrandCollageModel(
        collageImage:
            "https://i.pinimg.com/originals/83/ac/65/83ac658e8f5230248fba0db2a43260bc.jpg",
        collageTitle: "Hello3",
        createdAt: "03:15PM",
        userImage:
            "https://www.kevinashleyphotography.com/wp-content/uploads/2015/11/person.jpg",
        userName: "Ahmed Ali3"),
  ];

  void resetList() {
    list.clear();
  }

  void deleteItem({required int index}) {
    list.removeAt(index);
  }
}
