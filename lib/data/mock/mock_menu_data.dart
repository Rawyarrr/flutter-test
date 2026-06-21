import '../../core/constants/app_assets.dart';
import '../../core/constants/app_strings.dart';
import '../../models/category_model.dart';
import '../../models/food_model.dart';

abstract final class MockMenuData {
  static const List<CategoryModel> categories = [
    CategoryModel(id: 'all', name: AppStrings.all, imageUrl: AppAssets.pizza),
    CategoryModel(
      id: 'pizza',
      name: AppStrings.pizza,
      imageUrl: AppAssets.pizza,
    ),
    CategoryModel(
      id: 'burger',
      name: AppStrings.burger,
      imageUrl: AppAssets.burger,
    ),
    CategoryModel(
      id: 'shawarma',
      name: AppStrings.shawarma,
      imageUrl: AppAssets.shawarma,
    ),
  ];

  static const List<FoodModel> foods = [
    FoodModel(
      id: 'meat-shawarma',
      name: 'شاورمەی گۆشت',
      description: 'بەرگری تایبەت و دەبڵ پەنیز',
      price: '8,000',
      categoryId: 'shawarma',
      imageUrl: AppAssets.shawarma,
    ),
    FoodModel(
      id: 'double-cheese-burger',
      name: '• بەرگر دەبڵ پەنیر',
      description: 'بەرگری تایبەت و دەبڵ پەنیز',
      price: '8,000',
      categoryId: 'burger',
      imageUrl: AppAssets.burger,
    ),
    FoodModel(
      id: 'american-salad',
      name: 'زەڵاتەی ئەمریکی',
      description: 'بەرگری تایبەت و دەبڵ پەنیز',
      price: '8,000',
      categoryId: 'all',
      imageUrl: AppAssets.salad,
    ),
  ];
}
