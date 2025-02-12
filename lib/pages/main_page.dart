import 'package:flutter/material.dart';
import 'package:wallpaper_app/pages/accounts_page.dart';
import 'package:wallpaper_app/pages/explore_page.dart';
import 'package:wallpaper_app/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  bool _isVisible = true;
  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(afterScrollResult: afterScrollResult),
      ExplorePage(afterScrollResult: afterScrollResult),
      AccountsPage(afterScrollResult: afterScrollResult),
    ];
  }

  afterScrollResult(bool visibility) {
    setState(() {
      _isVisible = visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _isVisible ? 85 : 0,
        child: Wrap(
          children: [
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              fixedColor: Theme.of(context).colorScheme.inversePrimary,
              unselectedItemColor: Colors.grey,
              elevation: 0,
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              iconSize: 32,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: "For You",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.layers_outlined),
                  label: "Explore",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: "Account",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
