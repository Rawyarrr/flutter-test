class FoodModel {
  const FoodModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.imageUrl,
  });

  final String id;
  final String name;
  final String description;
  final String price;
  final String categoryId;
  final String imageUrl;
}
