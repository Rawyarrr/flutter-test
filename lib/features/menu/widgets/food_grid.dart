import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/food_model.dart';
import '../../../providers/menu_provider.dart';
import 'food_card.dart';

class FoodGrid extends StatelessWidget {
  const FoodGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final foods = context.select<MenuProvider, List<FoodModel>>(
      (provider) => provider.filteredFoods,
    );

    if (foods.isEmpty) {
      return const SizedBox(
        height: 150,
        child: Center(
          child: Text(
            AppStrings.noResults,
            style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
          ),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = (constraints.maxWidth - 12) / 2;
        const cardHeight = 198.0;

        return Directionality(
          textDirection: TextDirection.ltr,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: foods.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: cardWidth / cardHeight,
            ),
            itemBuilder: (context, index) => Directionality(
              textDirection: TextDirection.rtl,
              child: FoodCard(food: foods[index]),
            ),
          ),
        );
      },
    );
  }
}
