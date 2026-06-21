import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({required this.onChanged, super.key});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 18,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: TextField(
        onChanged: onChanged,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          hintText: AppStrings.searchHint,
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
            fontSize: 11,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            size: 23,
            color: AppColors.textPrimary,
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 49),
          contentPadding: const EdgeInsets.symmetric(vertical: 11),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
