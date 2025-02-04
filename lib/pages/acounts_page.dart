import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/components/profile_picture.dart';
import 'package:wallpaper_app/components/theme_toggle_button.dart';
import 'package:wallpaper_app/themes/theme_provider.dart';

class AccountsPage extends StatefulWidget {
  final Function(bool) afterScrollResult;
  const AccountsPage({
    super.key,
    required this.afterScrollResult,
  });

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  bool _isVisible = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        // result: false
        if (_isVisible) {
          _isVisible = false;
          widget.afterScrollResult(_isVisible);
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        // result: true
        if (!_isVisible) {
          _isVisible = true;
          widget.afterScrollResult(_isVisible);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              backgroundColor: Theme.of(context)
                  .colorScheme
                  .secondary
                  .withValues(alpha: 0.9),
              expandedHeight: 80,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Panels',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Member since 2/1/2025',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProfilePicture(
                        imageSource: "assets/images/profile_pic_2.png",
                        radius: 50,
                        height: 100,
                        width: 100,
                      ),
                      Text(
                        'testing123@gmail.com',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Theme',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => themeProvider,
                      child: ThemeToggleButton(
                        label: 'System',
                        isSelected: themeProvider.isDarkMode,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => themeProvider.toggleTheme(),
                      child: ThemeToggleButton(
                        label: 'Light',
                        isSelected: themeProvider.isDarkMode,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => themeProvider.toggleTheme(),
                      child: ThemeToggleButton(
                        label: 'Dark',
                        isSelected: themeProvider.isDarkMode,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  'App Icon',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 5),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 75,
                        width: 75,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            "assets/icons/sample-app-icon.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 75,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 75,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 75,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 75,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 75,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Panels © 2025,',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Panels Wallpaper Mobile App LLC.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'About',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'About',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Terms of Service',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 17),
                Text(
                  'Licenses',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Version',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '1.3.1',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
