class FoodModel {
  String image;
  String title;
  String description;
  FoodModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

String longText =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
List<FoodModel> foodList = [
  FoodModel(
      image: 'assets/images/foods/samosa.png',
      title: 'Chinese Samosa',
      description: longText),
  FoodModel(
      image: 'assets/images/foods/samosa.png',
      title: 'Indian Samosa',
      description: longText),
  FoodModel(
      image: 'assets/images/foods/samosa.png',
      title: 'Pakistani Samosa',
      description: longText)
];
