import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/components/app_list_tile.dart';
import 'package:wallpaper_app/components/profile_picture.dart';
import 'package:wallpaper_app/pages/login_page.dart';
import 'package:wallpaper_app/service/auth/auth_service.dart';
import 'package:wallpaper_app/service/user_provider.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
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
                    userProvider.user!.email == '' &&
                            userProvider.user!.name == ''
                        ? SizedBox()
                        : Column(
                            children: [
                              AppListTile(
                                title: 'Restore Purchases',
                                onTap: () {},
                              ),
                              AppListTile(
                                title: 'Delete Account',
                                onTap: () => showDeleteAccountAlertDialog(
                                    context, userProvider),
                              ),
                              AppListTile(
                                title: 'Sign Out',
                                onTap: () => showSignOutAlertDialog(
                                    context, authService),
                              ),
                            ],
                          )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

Future<void> showDeleteAccountAlertDialog(
    BuildContext context, UserProvider userProvider) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Confirm delete account?',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
        content: const Text(
            'Are you sure you want to delete your Panels account?',
            style: TextStyle(color: Colors.grey, fontSize: 18)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'No',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              await userProvider.deleteUser();
              if (context.mounted) {
                // Check if context is still valid
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                  (route) => false,
                );
              }
            },
            child: Text(
              'Yes',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
        ],
      );
    },
  );
}

Future<void> showSignOutAlertDialog(
    BuildContext context, AuthService authService) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Confirm sign out?',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
        content: const Text(
          'Are you sure you want to sign out of your Panels account?',
          style: TextStyle(color: Colors.grey, fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'No',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              await authService.signOut(context);
              if (context.mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                  (route) => false,
                );
              }
            },
            child: Text(
              'Yes',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
        ],
      );
    },
  );
}
