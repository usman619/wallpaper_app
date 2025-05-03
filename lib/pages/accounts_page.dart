import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/components/app_list_tile.dart';
import 'package:wallpaper_app/components/theme_selector.dart';
import 'package:wallpaper_app/components/user_profile_widget.dart';
import 'package:wallpaper_app/pages/user_account_page.dart';
import 'package:wallpaper_app/service/auth/auth_service.dart';
import 'package:wallpaper_app/service/user_provider.dart';

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
  late final UserProvider userProvider;
  late final AuthService authService;

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
    authService = Provider.of<AuthService>(context, listen: false);

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
    // final themeProvider = Provider.of<ThemeProvider>(context);
    if (userProvider.user == null) {
      return const Center(child: CircularProgressIndicator());
    }
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
              toolbarHeight: 80,
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
              spacing: 10,
              children: [
                UserProfileWidget(
                  name: userProvider.user!.name,
                  photoUrl: userProvider.user!.photoUrl,
                  onPressed: () async {
                    await authService.signInWithGoogle(context);
                    Navigator.popAndPushNamed(context, '/main');
                  },
                ),
                ListTile(
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                AppListTile(title: 'Theme'),
                ThemeSelector(),
                AppListTile(title: 'App Icon'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 10,
                    children: [
                      Container(
                        height: 75,
                        width: 75,
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
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    spacing: 5,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        'Panels © 2025,',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        'Panels Wallpaper Mobile App LLC.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 10)
                    ],
                  ),
                ),
                ListTile(
                  title: Text(
                    'About',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                AppListTile(
                  title: 'About',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserAccountPage(),
                      ),
                    );
                  },
                ),
                AppListTile(title: 'Privacy Policy'),
                AppListTile(title: 'Terms of Service'),
                AppListTile(title: 'Licenses'),
                AppListTile(title: 'Version'),
                AppListTile(title: '1.3.1'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
