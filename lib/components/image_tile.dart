import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/components/creator_picture.dart';

class ImageTile extends StatelessWidget {
  final String imageSource;
  final String authorImageSource;
  final int index;
  final double extent;

  const ImageTile({
    super.key,
    required this.imageSource,
    required this.authorImageSource,
    required this.index,
    required this.extent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showImageDetails(context, imageSource);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAlias,
        height: extent,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: imageSource,
              fit: BoxFit.cover,
            ),
            // Image.network(
            //   imageSource,
            //   fit: BoxFit.cover,
            // ),
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
                    InkWell(
                      onTap: () {
                        // Add Wallpaper to favorite
                      },
                      child: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showImageDetails(BuildContext context, String imageSource) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 1,
            child: Column(
              children: [
                // Image
                Stack(
                  children: [
                    CachedNetworkImage(imageUrl: imageSource),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.cancel,
                          size: 28,
                          color: Theme.of(context)
                              .colorScheme
                              .inversePrimary
                              .withValues(
                                alpha: 0.75,
                              ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.favorite_border_rounded,
                              size: 28,
                              color: Theme.of(context)
                                  .colorScheme
                                  .inversePrimary
                                  .withValues(
                                    alpha: 0.75,
                                  ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.share_rounded,
                              size: 28,
                              color: Theme.of(context)
                                  .colorScheme
                                  .inversePrimary
                                  .withValues(
                                    alpha: 0.75,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Image Title
                Text(
                  'Wallpaper Name',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                // Download Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: MaterialButton(
                    onPressed: () {},
                    padding: const EdgeInsets.all(15),
                    color: Theme.of(context).colorScheme.inversePrimary,
                    textColor: Theme.of(context).colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image_outlined),
                        const SizedBox(width: 5),
                        Text(
                          'Get Wallpaper',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Creator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CreatorPicture(
                      imageSource: authorImageSource,
                      badgeType: BadgeType.add,
                      radius: 25,
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(width: 15),
                    Text(
                      'Name of the Creator',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                // Image Theme
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.twenty_four_mp_rounded),
                    const SizedBox(width: 15),
                    Text(
                      'Theme - Photography, 3D etc',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                // Resolution
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.info),
                    const SizedBox(width: 15),
                    Text(
                      'Full Res - Resolution',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                // Quality
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.info),
                    const SizedBox(width: 15),
                    Text(
                      'Quality - Resolution',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}
