import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/components/app_button.dart';
import 'package:wallpaper_app/service/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final AuthService authService;

  @override
  void initState() {
    super.initState();
    authService = Provider.of<AuthService>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.red[500],
              width: double.infinity,
              height: double.infinity,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 15,
              children: [
                const SizedBox(height: 50),
                Text(
                  'Welcome to Panels',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Lottie.asset(
                  'assets/animations/Panels-Animation.json',
                  animate: true,
                  width: 300,
                  height: 300,
                ),
                Spacer(),
                AppButton(
                  onPressed: () async {
                    // Use the BuildContext available here.
                    await authService.signInWithGoogle(context);
                  },
                  text: 'Sign in with Google',
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                  leading: Image.asset(
                    'assets/images/g-logo-2.png',
                    width: 25,
                  ),
                ),
                AppButton(
                  onPressed: () {},
                  text: 'Join Panels+',
                  buttonColor: Colors.redAccent,
                  textColor: Colors.white,
                  leading: Image.asset(
                    'assets/images/crown_icon.png',
                    color: Colors.white,
                    width: 25,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Sign for now',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
