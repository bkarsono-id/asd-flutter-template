import 'package:flutter/material.dart';

class ImageHelper extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double? borderRadius;
  final String? semanticsLabel;

  const ImageHelper({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
      child: Image.asset(
        imagePath,
        width: width ?? screenWidth * 0.5,
        height: height ?? screenWidth * 0.5,
        fit: fit,
        semanticLabel: semanticsLabel,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[300],
            width: width ?? screenWidth * 0.5,
            height: height ?? screenWidth * 0.5,
            child: const Icon(Icons.broken_image, color: Colors.red),
          );
        },
      ),
    );
  }
}
