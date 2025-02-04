import 'package:flutter/material.dart';

enum BadgeType { edit, add, check }

class CreatorPicture extends StatefulWidget {
  final String imageSource;
  final double radius;
  final double height;
  final double width;
  final BadgeType badgeType;
  const CreatorPicture({
    super.key,
    required this.imageSource,
    required this.radius,
    required this.height,
    required this.width,
    required this.badgeType,
  });

  @override
  State<CreatorPicture> createState() => _CreatorPictureState();
}

class _CreatorPictureState extends State<CreatorPicture> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            // Profile picture
            CircleAvatar(
              radius: widget.radius,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                  widget.imageSource,
                  scale: 3,
                  fit: BoxFit.cover,
                  height: widget.height,
                  width: widget.width,
                ),
              ),
            ),
            // Badge
            _buildBadge(widget.badgeType, context),
          ],
        ),
      ],
    );
  }
}

Widget _buildBadge(BadgeType type, BuildContext context) {
  switch (type) {
    case BadgeType.edit:
      return _badgeIcon(context, Icons.edit, Colors.black, false);
    case BadgeType.add:
      return _badgeIcon(context, Icons.add, Colors.redAccent, false);
    case BadgeType.check:
      return _badgeIcon(context, Icons.check, Colors.grey.shade700, false);
  }
}

Widget _badgeIcon(
    BuildContext context, IconData iconType, Color color, bool transparent) {
  return Align(
    alignment: Alignment.bottomRight,
    child: Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Theme.of(context).colorScheme.surface,
          width: 3,
        ),
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconType,
        size: 18,
        color: Colors.white,
      ),
    ),
  );
}
