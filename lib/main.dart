import 'package:flutter/material.dart';
import 'package:wallpaper_app/pages/main_page.dart';
import 'package:wallpaper_app/pages/profile_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // brightness: Brightness.dark,
        // colorScheme: const ColorScheme.dark(),
        fontFamily: 'NotoScans',
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
