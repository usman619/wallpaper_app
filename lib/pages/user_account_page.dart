import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/components/app_list_tile.dart';
import 'package:wallpaper_app/components/profile_picture.dart';

class UserAccountPage extends StatefulWidget {
  const UserAccountPage({super.key});

  @override
  State<UserAccountPage> createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
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
                imageSource: 'assets/images/profile_pic_2.png',
                radius: 75,
                height: 100,
                width: 100,
              ),
              Text('usmanshahab191@gmail.com',
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
              ),
              AppListTile(
                title: 'Sign Out',
              ),
            ],
          ),
        ));
  }
}
