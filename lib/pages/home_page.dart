import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaper_app/components/image_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return ImageTile(
            imageSource: "https://picsum.photos/500/500?random=$index",
            index: index,
            extent: (index % 2) == 0 ? 300 : 150,
          );
        },
      ),
    );
  }
}
