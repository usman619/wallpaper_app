import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaper_app/components/collection_tile.dart';
import 'package:wallpaper_app/components/creator_picture.dart';
import 'package:wallpaper_app/components/image_tile.dart';

class HomePage extends StatefulWidget {
  final Function(bool) afterScrollResult;
  const HomePage({
    super.key,
    required this.afterScrollResult,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isVisible = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(
      () {
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              title: Center(
                child: CreatorPicture(
                  imageSource: "assets/images/profile_pic_2.png",
                  radius: 25,
                  height: 50,
                  width: 50,
                  badgeType: BadgeType.edit,
                ),
              ),
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Suggested'),
                  Tab(text: 'Liked'),
                  Tab(text: 'Library')
                ],
                overlayColor: WidgetStatePropertyAll(Colors.grey[320]),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15.5,
                ),
                labelColor: Theme.of(context).colorScheme.inversePrimary,
                indicatorColor: Colors.red,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 5,
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            // Tab - Suggested
            MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              padding: EdgeInsets.all(8),
              itemBuilder: (context, index) {
                return (index % 2) == 0
                    ? ImageTile(
                        imageSource:
                            "https://picsum.photos/500/500?random=$index",
                        authorImageSource: "assets/images/profile_pic_2.png",
                        index: index,
                        extent: 300,
                      )
                    : CollectionTile(
                        index: index,
                        extent: 150,
                      );
              },
            ),
            // Tab - Liked
            SizedBox(),
            // Tab - Library
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
