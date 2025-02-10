import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/components/app_button.dart';
import 'package:wallpaper_app/components/profile_picture.dart';
import 'package:wallpaper_app/pages/user_account_page.dart';
import 'package:wallpaper_app/service/auth/auth_service.dart';

class UserProfileWidget extends StatefulWidget {
  final String name;
  final String photoUrl;
  final VoidCallback? onPressed;
  const UserProfileWidget({
    super.key,
    required this.name,
    required this.photoUrl,
    this.onPressed,
  });

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  late final AuthService authService;
  @override
  void initState() {
    super.initState();
    authService = Provider.of<AuthService>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.name != '' && widget.photoUrl != '') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UserAccountPage(),
            ),
          );
        }
      },
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: widget.name == '' && widget.photoUrl == ''
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: AppButton(
                  onPressed:
                      widget.onPressed != null ? widget.onPressed! : () {},
                  text: 'Sign In',
                  buttonColor: Theme.of(context).colorScheme.secondary,
                  textColor: Theme.of(context).colorScheme.inversePrimary,
                  leading: Image.asset(
                    'assets/images/g-logo-2.png',
                    width: 25,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfilePicture(
                    imageSource: widget.photoUrl,
                    radius: 50,
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
