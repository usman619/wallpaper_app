import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/pages/collections_page.dart';

class CollectionTile extends StatefulWidget {
  final int index;
  final double extent;
  const CollectionTile({
    super.key,
    required this.index,
    required this.extent,
  });

  @override
  State<CollectionTile> createState() => _CollectionTileState();
}

class _CollectionTileState extends State<CollectionTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CollectionsPage(),
          ),
        );
      },
      child: SizedBox(
        height: widget.extent,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 25,
              right: 25,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87,
                        blurRadius: 6,
                        spreadRadius: -6,
                        offset: Offset(0, 10))
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: CachedNetworkImage(
                  imageUrl:
                      "https://picsum.photos/500/500?random=img_1${widget.index}",
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 15,
              right: 15,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87,
                        blurRadius: 8,
                        spreadRadius: -6,
                        offset: Offset(0, 10))
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: CachedNetworkImage(
                  imageUrl:
                      "https://picsum.photos/500/500?random=img_2${widget.index}",
                ),
              ),
            ),
            Positioned.fill(
              bottom: 30,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87,
                        blurRadius: 8,
                        spreadRadius: -6,
                        offset: Offset(0, 10))
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: CachedNetworkImage(
                  imageUrl:
                      "https://picsum.photos/500/500?random=img_3${widget.index}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 35,
              right: 5,
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  'assets/images/crown_icon.png',
                  scale: 25,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
