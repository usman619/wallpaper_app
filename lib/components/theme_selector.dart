import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/components/theme_button.dart';
import 'package:wallpaper_app/themes/theme_provider.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ThemeButton(
          onTap: () => themeProvider.setTheme(0),
          label: 'System',
          isSelected: themeProvider.selectedThemeIndex == 0,
        ),
        const SizedBox(width: 15),
        ThemeButton(
          onTap: () => themeProvider.setTheme(1),
          label: 'Light',
          isSelected: themeProvider.selectedThemeIndex == 1,
        ),
        const SizedBox(width: 15),
        ThemeButton(
          onTap: () => themeProvider.setTheme(2),
          label: 'Dark',
          isSelected: themeProvider.selectedThemeIndex == 2,
        ),
      ],
    );
  }
}
