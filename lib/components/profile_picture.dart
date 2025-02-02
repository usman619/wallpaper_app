import 'package:flutter/material.dart';

class ProfilePicture extends StatefulWidget {
  final String imageSource;
  final double radius;
  final double height;
  final double width;
  const ProfilePicture({
    super.key,
    required this.imageSource,
    required this.radius,
    required this.height,
    required this.width,
  });

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
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
    );
  }
}
