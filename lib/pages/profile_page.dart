import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wallpaper_app/components/collection_tile.dart';
import 'package:wallpaper_app/components/creator_picture.dart';
import 'package:wallpaper_app/components/image_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                toolbarHeight: 125,
                pinned: true,
                flexibleSpace: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: CreatorPicture(
                          imageSource: "assets/images/profile_pic_2.png",
                          radius: 35,
                          height: 75,
                          width: 75,
                          badgeType: BadgeType.check,
                        ),
                      ),
                      Text(
                        'Muhammad Usman',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/instagram.svg',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            'assets/icons/x-twitter.svg',
                            width: 24,
                            height: 24,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                bottom: TabBar(
                  tabs: [
                    Tab(text: 'Singles'),
                    Tab(text: 'Collections'),
                  ],
                  overlayColor: WidgetStatePropertyAll(
                    Colors.grey[320],
                  ),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.5,
                  ),
                  labelColor: Colors.black,
                  indicatorColor: Colors.red,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 5,
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: TabBarView(
              children: [
                AlignedGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  itemBuilder: (context, index) {
                    return ImageTile(
                      imageSource:
                          "https://picsum.photos/500/500?random=$index",
                      authorImageSource: "assets/images/profile_pic_2.png",
                      index: index,
                      extent: 300,
                    );
                  },
                ),
                AlignedGridView.count(
                  crossAxisCount: 1,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  itemBuilder: (context, index) {
                    return CollectionTile(
                      index: index,
                      extent: 240,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
