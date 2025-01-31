import 'package:flutter/material.dart';

class ImageTile extends StatelessWidget {
  final String imageSource;
  final int index;
  final double extent;

  const ImageTile({
    super.key,
    required this.imageSource,
    required this.index,
    required this.extent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      height: extent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            imageSource,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              color: Colors.black.withValues(
                alpha: 0.7,
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Wallpaper $index",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Icon(Icons.favorite_border_outlined)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
