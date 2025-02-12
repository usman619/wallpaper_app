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
            heightFactor: 0.95,
            child: Column(
              spacing: 10,
              children: [
                // Image
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () => showDownloadOptions(context),
                      child: CachedNetworkImage(
                        imageUrl: imageSource,
                      ),
                    ),
                    Positioned(
                      top: 15,
                      left: 5,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.cancel_outlined,
                            size: 24,
                            color: Colors.black.withValues(alpha: 0.5),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15,
                      right: 5,
                      child: Row(
                        spacing: 5,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.5),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.favorite_border_rounded,
                                size: 24,
                                color: Colors.black.withValues(alpha: 0.5),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.5),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.share_rounded,
                                size: 24,
                                color: Colors.black.withValues(alpha: 0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Image Title
                Text(
                  'Wallpaper Name',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Download Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: MaterialButton(
                    onPressed: () => showDownloadOptions(context),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    color: Theme.of(context).colorScheme.inversePrimary,
                    textColor: Theme.of(context).colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image_outlined),
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

                // Creator
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 15,
                    children: [
                      CreatorPicture(
                        imageSource: authorImageSource,
                        badgeType: BadgeType.add,
                        radius: 25,
                        height: 50,
                        width: 50,
                      ),
                      Text(
                        'Name of the Creator',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),

                // Image Theme
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 15,
                    children: [
                      Icon(Icons.settings_input_composite_rounded),
                      Text(
                        'Theme - Photography, 3D etc',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 15,
                    children: [
                      Icon(Icons.info),
                      Text(
                        'Full Res - Resolution',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                // Quality
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 15,
                    children: [
                      Icon(Icons.info),
                      Text(
                        'Quality - Resolution',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                // AppListTile(
                //   leading: Icon(Icons.settings_input_composite_rounded),
                //   title: 'Full Res - Resolution',
                // ),

                // // Resolution
                // AppListTile(
                //   leading: Icon(Icons.info),
                //   title: 'Full Res - Resolution',
                // ),
                // // Quality
                // AppListTile(
                //   leading: Icon(Icons.info),
                //   title: 'Quality - Resolution',
                // )
              ],
            ),
          );
        });
  }

  void showDownloadOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.45,
          child: Column(
            spacing: 20,
            children: [
              Row(
                children: [
                  IconButton(
                    alignment: Alignment.topLeft,
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.cancel,
                      size: 28,
                      color: Theme.of(context)
                          .colorScheme
                          .inversePrimary
                          .withValues(alpha: 0.5),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Download Options',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  SizedBox(width: 48),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: MaterialButton(
                  onPressed: () {
                    // Download the Image
                  },
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  color: Theme.of(context).colorScheme.inversePrimary,
                  textColor: Theme.of(context).colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5,
                    children: [
                      Icon(Icons.download_outlined),
                      Text(
                        'Download HD',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: MaterialButton(
                  onPressed: () {
                    // Download the Image
                  },
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  color: Theme.of(context).colorScheme.inversePrimary,
                  textColor: Theme.of(context).colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5,
                    children: [
                      Icon(Icons.play_circle_filled_rounded),
                      Text(
                        'Watch ad for Full-Res',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: MaterialButton(
                  onPressed: () {
                    // Download the Image
                  },
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  color: Colors.amber,
                  textColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5,
                    children: [
                      Icon(Icons.play_circle_filled_rounded),
                      Text(
                        'Go Ad-free',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
