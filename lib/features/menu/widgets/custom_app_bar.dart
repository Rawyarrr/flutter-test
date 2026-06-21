import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            AppStrings.appTitle,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Positioned(
            right: 2,
            child: _HeaderIcon(icon: Icons.shopping_bag_outlined),
          ),
          const Positioned(left: 0, child: _NotificationButton()),
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 39,
      height: 39,
      child: Icon(icon, size: 22, color: AppColors.textPrimary),
    );
  }
}

class _NotificationButton extends StatelessWidget {
  const _NotificationButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 39,
      height: 39,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(
            Icons.notifications_none_rounded,
            size: 21,
            color: AppColors.textPrimary,
          ),
          Positioned(
            top: 6,
            right: 7,
            child: Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.surface, width: 1.2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
