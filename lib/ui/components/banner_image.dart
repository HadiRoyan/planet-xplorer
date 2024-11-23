import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  const BannerImage({
    this.imageAssets = 'assets/images/banner-v2.jpeg',
    super.key,
  });

  final String imageAssets;

  @override
  Widget build(BuildContext context) {
    return Image.asset(imageAssets);
  }
}
