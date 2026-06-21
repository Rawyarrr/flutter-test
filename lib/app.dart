import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_strings.dart';
import 'core/theme/app_theme.dart';
import 'features/menu/screens/menu_screen.dart';
import 'providers/menu_provider.dart';

class RestaurantAdminApp extends StatelessWidget {
  const RestaurantAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MenuProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appTitle,
        theme: AppTheme.light,
        home: const Directionality(
          textDirection: TextDirection.rtl,
          child: MenuScreen(),
        ),
      ),
    );
  }
}
