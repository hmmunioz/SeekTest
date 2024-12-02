import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final String assetPath;
  final double size;

  const CircularImage({
    super.key,
    required this.assetPath,
    this.size = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        assetPath,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: size,
            height: size,
            color: Colors.grey[300],
            child: Icon(
              Icons.broken_image,
              size: size * 0.5,
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
