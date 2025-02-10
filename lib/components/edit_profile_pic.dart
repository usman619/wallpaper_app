import 'package:flutter/material.dart';

enum BadgeType { edit, add, check }

class EditProfilePic extends StatefulWidget {
  final String imageSource;
  final double radius;
  final double height;
  final double width;
  const EditProfilePic({
    super.key,
    required this.imageSource,
    required this.radius,
    required this.height,
    required this.width,
  });

  @override
  State<EditProfilePic> createState() => _EditProfilePicState();
}

class _EditProfilePicState extends State<EditProfilePic> {
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
                child: widget.imageSource == ''
                    ? Image.asset(
                        'assets/images/placeholder_image.png',
                        scale: 3,
                        fit: BoxFit.cover,
                        height: widget.height,
                        width: widget.width,
                      )
                    : Image.network(
                        widget.imageSource,
                        scale: 3,
                        fit: BoxFit.cover,
                        height: widget.height,
                        width: widget.width,
                      ),
              ),
            ),
            // Badge
            _buildBadge(context),
          ],
        ),
      ],
    );
  }
}

Widget _buildBadge(BuildContext context) {
  return _badgeIcon(context, Icons.edit, Colors.black, false);
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
