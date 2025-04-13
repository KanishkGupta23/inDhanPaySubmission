import 'package:flutter/material.dart';

class WallpaperWidget extends StatefulWidget {
  const WallpaperWidget({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  State<WallpaperWidget> createState() => _WallpaperWidgetState();
}

class _WallpaperWidgetState extends State<WallpaperWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      child: Image.network(widget.imageUrl),
    );
  }
}