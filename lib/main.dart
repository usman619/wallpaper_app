import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wallpaper_app/pages/login_page.dart';
import 'package:wallpaper_app/pages/main_page.dart';
import 'package:wallpaper_app/pages/splash_screen.dart';
import 'package:wallpaper_app/service/auth/auth_service.dart';
import 'package:wallpaper_app/themes/theme_provider.dart';
import 'package:wallpaper_app/user_provider.dart';
import 'package:wallpaper_app/utils/constant.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthService(Supabase.instance.client),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (
        context,
        themeProvider,
        child,
      ) {
        return MaterialApp(
          title: 'Wallpaper App',
          debugShowCheckedModeBanner: false,
          theme: themeProvider.themeData,
          home: const LoginPage(),
          routes: <String, WidgetBuilder>{
            '/splash': (context) => const SplashScreen(),
            '/main': (context) => const MainPage(),
            '/login': (context) => const LoginPage(),
          },
        );
      },
    );
  }
}
