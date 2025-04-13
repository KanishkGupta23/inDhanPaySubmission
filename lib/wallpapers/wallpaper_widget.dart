import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WallpaperWidget extends StatefulWidget {
  const WallpaperWidget({super.key, required this.imageUrl});
  final Uint8List imageUrl;
  @override
  State<WallpaperWidget> createState() => _WallpaperWidgetState();
}

class _WallpaperWidgetState extends State<WallpaperWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      child: Image.memory(widget.imageUrl),
    );
  }
}