import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/components/app_list_tile.dart';
import 'package:wallpaper_app/components/profile_picture.dart';
import 'package:wallpaper_app/pages/login_page.dart';
import 'package:wallpaper_app/service/auth/auth_service.dart';
import 'package:wallpaper_app/user_provider.dart';

class UserAccountPage extends StatefulWidget {
  const UserAccountPage({super.key});

  @override
  State<UserAccountPage> createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
  late final UserProvider userProvider;
  late final AuthService authService;

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
    authService = Provider.of<AuthService>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Account',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10,
            children: [
              ProfilePicture(
                imageSource: userProvider.user!.photoUrl,
                radius: 75,
                height: 100,
                width: 100,
              ),
              Text(userProvider.user!.email,
                  style: TextStyle(
                    fontSize: 16,
                  )),
              AppListTile(
                title: 'Notifications',
                value: true,
                onChanged: CupertinoSwitch(
                    value: false,
                    onChanged: (value) {
                      // change the value of th switch
                      value = !value;
                    }),
              ),
              AppListTile(
                title: 'Anoyomous Reporting',
                subtitle: 'Unidentified usage stats, performance etc.',
                value: true,
                onChanged: CupertinoSwitch(
                  value: false,
                  onChanged: (value) {
                    // change the value of th switch
                    value = !value;
                  },
                ),
              ),
              AppListTile(
                title: 'Join Newsletter',
                subtitle: 'Info about upcoming wallpapers & releases.',
                value: true,
                onChanged: CupertinoSwitch(
                  value: false,
                  onChanged: (value) {
                    // change the value of th switch
                    value = !value;
                  },
                ),
              ),
              AppListTile(
                title: 'Restore Purchases',
              ),
              AppListTile(
                title: 'Delete Account',
                onTap: () async {
                  await userProvider.deleteUser();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                      (route) => false);
                },
              ),
              AppListTile(
                title: 'Sign Out',
                onTap: () async {
                  await authService.signOut(context);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                      (route) => false);
                },
              ),
            ],
          ),
        ));
  }
}
