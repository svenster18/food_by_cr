class Dessert {
  String name;
  String price;
  String description;
  int calories;
  int minCreateTime;
  int maxCreateTime;
  double rating;
  String imageAsset;

  Dessert({
    required this.name,
    required this.price,
    required this.description,
    required this.calories,
    required this.minCreateTime,
    required this.maxCreateTime,
    required this.rating,
    required this.imageAsset,
  });
}

var dessertList = [
  Dessert(
    name: "Choco Milk",
    price : "15.000",
    description: "Chocolate milk flavor dessert box",
    calories: 55,
    minCreateTime: 20,
    maxCreateTime: 30,
    rating: 4.7,
    imageAsset: "images/choco-milk.png"
  ),
  Dessert(
      name: "Black Forest",
      price : "13.000",
      description: "Black forest flavor dessert box",
      calories: 50,
      minCreateTime: 20,
      maxCreateTime: 30,
      rating: 4.5,
      imageAsset: "images/black-forest.png"
  ),
  Dessert(
      name: "Matcha",
      price : "17.000",
      description: "Matcha flavor dessert box",
      calories: 53,
      minCreateTime: 20,
      maxCreateTime: 30,
      rating: 4.2,
      imageAsset: "images/matcha.png"
  ),
  Dessert(
      name: "Regal",
      price : "18.000",
      description: "Regal flavor dessert box",
      calories: 58,
      minCreateTime: 20,
      maxCreateTime: 30,
      rating: 4.7,
      imageAsset: "images/regal.png"
  ),
];