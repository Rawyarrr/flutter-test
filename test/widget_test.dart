import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_admin/providers/menu_provider.dart';

void main() {
  group('MenuProvider', () {
    test('filters foods by category', () {
      final provider = MenuProvider()..selectCategory('burger');

      expect(provider.filteredFoods, hasLength(1));
      expect(provider.filteredFoods.single.categoryId, 'burger');
    });

    test('filters foods by search text', () {
      final provider = MenuProvider()..updateSearchQuery('شاورمە');

      expect(provider.filteredFoods, hasLength(1));
      expect(provider.filteredFoods.single.id, 'meat-shawarma');
    });
  });
}
