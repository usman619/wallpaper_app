import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaper_app/components/image_tile.dart';

const double kImageSliderHeight = 320;

class ExplorePage extends StatefulWidget {
  final Function(bool) afterScrollResult;
  const ExplorePage({super.key, required this.afterScrollResult});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  var _selectedSlideIndex = 0;
  bool _isVisible = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        // result: false
        if (_isVisible &&
            _scrollController.position.pixels >= kImageSliderHeight) {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isVisible ? Colors.black : Colors.white,
      body: SafeArea(
        top: !_isVisible,
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: kImageSliderHeight,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      PageView.builder(
                        onPageChanged: (value) {
                          setState(() {
                            _selectedSlideIndex = value;
                          });
                        },
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    "https://picsum.photos/500/500?random=slide_$index",
                                fit: BoxFit.cover,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.black,
                                        Colors.transparent
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      stops: [0.01, 1]),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      // Indicator
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: List.generate(6, (index) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: 10,
                              height: 10,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index == _selectedSlideIndex
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            );
                          }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: SliverAppBar(
                  floating: true,
                  snap: true,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                  backgroundColor: _isVisible
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.95),
                  title: TextButton.icon(
                    onPressed: () {},
                    label: Text('Search'),
                    icon: Icon(Icons.search_rounded),
                    style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(Colors.black),
                      iconSize: WidgetStatePropertyAll(24),
                      textStyle: WidgetStatePropertyAll(
                        TextStyle(fontSize: 20),
                      ),
                      overlayColor: WidgetStatePropertyAll(Colors.grey[320]),
                    ),
                  ),
                  centerTitle: true,
                ),
              ),
            ];
          },
          body: Container(
            color: Colors.white,
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              padding: EdgeInsets.all(8),
              itemBuilder: (context, index) {
                return ImageTile(
                  imageSource:
                      "https://picsum.photos/500/500?random=img_$index",
                  authorImageSource: "assets/images/profile_pic_3.png",
                  index: index,
                  extent: (index % 2) == 0 ? 300 : 150,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
