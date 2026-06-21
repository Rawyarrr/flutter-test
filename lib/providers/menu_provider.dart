import 'package:flutter/foundation.dart';

import '../data/mock/mock_menu_data.dart';
import '../models/category_model.dart';
import '../models/food_model.dart';

class MenuProvider extends ChangeNotifier {
  String _selectedCategory = 'all';
  String _searchQuery = '';

  String get selectedCategory => _selectedCategory;
  String get searchQuery => _searchQuery;
  List<CategoryModel> get categories => MockMenuData.categories;
  List<FoodModel> get foods => MockMenuData.foods;

  List<FoodModel> get filteredFoods {
    final normalizedQuery = _searchQuery.trim().toLowerCase();

    return foods
        .where((food) {
          final matchesCategory =
              _selectedCategory == 'all' ||
              food.categoryId == _selectedCategory;
          final matchesSearch =
              normalizedQuery.isEmpty ||
              food.name.toLowerCase().contains(normalizedQuery) ||
              food.description.toLowerCase().contains(normalizedQuery);
          return matchesCategory && matchesSearch;
        })
        .toList(growable: false);
  }

  void selectCategory(String categoryId) {
    if (_selectedCategory == categoryId) return;
    _selectedCategory = categoryId;
    notifyListeners();
  }

  void updateSearchQuery(String value) {
    if (_searchQuery == value) return;
    _searchQuery = value;
    notifyListeners();
  }
}
