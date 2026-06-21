Act as a world-class senior Flutter developer and UI engineer.

I have attached a screenshot of a Kurdish restaurant admin/menu screen. Recreate this UI in Flutter as close as possible to the screenshot, pixel-perfect, clean, modern, and production-quality.

Important:
- Use Flutter.
- Use Provider for state management.
- No database.
- No Firebase.
- No API.
- Use mock data only.
- All visible texts must be Kurdish Sorani.
- The UI must support RTL direction properly.
- Code must look human-written by a senior Flutter developer, not generated messy code.
- Focus on clean architecture, reusable widgets, clean naming, const constructors, and separation of UI/state/mock data.

Project goal:
Build a single-screen Flutter app that looks exactly like the screenshot:
- Restaurant admin menu screen.
- Top title: "ڕێستورانتەکەم"
- Top left circular notification icon with small green dot.
- Top right shopping bag/order icon.
- Search bar under the title with Kurdish placeholder: "گەڕان بەدوای خواردن"
- Two action buttons:
  1. Green filled button: "زیادکردنی خواردن"
  2. White outlined green button: "زیادکردنی بەش"
- Category section title: "بەشەکان"
- Horizontal category chips/cards:
  - Active green chip: "هەموو" with pizza image/icon
  - "پیتزا"
  - "بەرگر"
  - "شاورمە"
- Food section title: "خواردنەکان"
- Product grid with two cards per row.
- Food cards should include:
  - Rounded food image
  - Food name in Kurdish
  - Small description in Kurdish
  - Price in green, example: "8,000"
  - Currency text: "دینار"
  - Edit icon in green
  - Delete icon in red
- Bottom navigation bar with 3 icons:
  - List/orders icon
  - Menu/food icon active in green with label "مێنو"
  - Profile/user icon
- Background should be very light gray/off-white.
- Cards should be white with soft shadows and rounded corners.
- Main accent color should be green similar to screenshot.

Use these mock food items:
1. name: "بۆرگەر دوبڵ پەنیر"
   description: "بۆرگەری تایبەت و دوبڵ پەنیر"
   price: "8,000"
   category: "بەرگر"

2. name: "شاورمەی گۆشت"
   description: "شاورمەی تایبەت و دوبڵ پەنیر"
   price: "8,000"
   category: "شاورمە"

3. name: "زەڵاتەی ئەمریکی"
   description: "زەڵاتەی تایبەت و دوبڵ پەنیر"
   price: "8,000"
   category: "هەموو"

Use these categories:
- هەموو
- پیتزا
- بەرگر
- شاورمە

State management requirements:
- Create a Provider called MenuProvider.
- It should manage:
  - selectedCategory
  - searchQuery
  - list of mock categories
  - list of mock foods
  - filtered foods based on selected category and search query
- Tapping category changes active category.
- Typing in search filters food list.
- Edit/delete buttons can just show SnackBars for now.

Architecture:
Use this structure:

lib/
  main.dart
  app.dart
  core/
    theme/
      app_colors.dart
      app_theme.dart
    constants/
      app_assets.dart
      app_strings.dart
  data/
    mock/
      mock_menu_data.dart
  models/
    category_model.dart
    food_model.dart
  providers/
    menu_provider.dart
  features/
    menu/
      screens/
        menu_screen.dart
      widgets/
        custom_app_bar.dart
        search_box.dart
        menu_action_buttons.dart
        category_list.dart
        category_chip.dart
        food_grid.dart
        food_card.dart
        custom_bottom_nav_bar.dart

Design details:
- Wrap the whole app with Directionality(textDirection: TextDirection.rtl).
- Use a Kurdish/Arabic friendly font. Prefer GoogleFonts.notoSansArabic if using google_fonts. If not, use default font but make sure RTL is clean.
- Use MediaQuery/LayoutBuilder so it works on different phone sizes but visually matches the screenshot.
- Use SafeArea.
- Use Scaffold background color around #F7F8FA.
- Use green color around #22C55E.
- Text color: dark gray/black.
- Secondary text: light gray.
- Red delete icon around #EF4444.
- Use rounded corners:
  - Search bar radius around 16
  - Buttons radius around 8
  - Cards radius around 14
  - Images radius around 10
- Food card width should allow 2 cards per row.
- Use GridView.builder with shrinkWrap true and disabled inner scrolling if needed.
- Use SingleChildScrollView for the main content.
- Bottom navigation should be clean and close to the screenshot.

Assets:
If real food images are not available, use high-quality network image URLs or local placeholder containers with food-like images. Prefer Unsplash-style food images, but keep code easy to replace later.
Create AppAssets constants for image URLs.
Use ClipRRect for food images.
Make images cover the container using BoxFit.cover.

Code quality rules:
- Do not put all code in main.dart.
- Do not use random messy inline styling everywhere.
- Use reusable widgets.
- Use final fields.
- Use const constructors wherever possible.
- Use private helper methods only when useful.
- No over-engineering.
- No unnecessary packages except provider and optionally google_fonts.
- No database code.
- No fake backend code.
- No comments unless they are useful.
- The final code should run immediately with flutter run.

Deliverables:
1. Full Flutter code for all files.
2. pubspec.yaml dependencies.
3. Explain briefly how to run.
4. Make sure there are no compile errors.

Important visual matching:
The screen must visually match the attached screenshot as closely as possible:
- Same spacing feeling.
- Same card layout.
- Same RTL alignment.
- Same green buttons and category active state.
- Same product card style.
- Same bottom navigation style.

Before writing code, first analyze the screenshot layout carefully in UI_asset/ui.png and then implement it with clean Flutter widgets. Do not simplify the design.