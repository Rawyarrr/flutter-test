import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../providers/menu_provider.dart';
import '../widgets/category_list.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/food_grid.dart';
import '../widgets/menu_action_buttons.dart';
import '../widgets/search_box.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const CustomBottomNavBar(),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 5, 24, 24),
              sliver: SliverList.list(
                children: [
                  const CustomAppBar(),
                  const SizedBox(height: 7),
                  SearchBox(
                    onChanged: context.read<MenuProvider>().updateSearchQuery,
                  ),
                  const SizedBox(height: 34),
                  const MenuActionButtons(),
                  const SizedBox(height: 22),
                  const _SectionTitle(AppStrings.categories),
                  const SizedBox(height: 8),
                  const CategoryList(),
                  const SizedBox(height: 13),
                  const _SectionTitle(AppStrings.foods),
                  const SizedBox(height: 8),
                  const FoodGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: AppColors.textSecondary,
        fontSize: 11,
      ),
    );
  }
}
