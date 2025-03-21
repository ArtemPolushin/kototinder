import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../model/cat_image.dart';

class CatImageWidget extends StatelessWidget {
  final CatImage catImage;

  const CatImageWidget({super.key, required this.catImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(imageUrl: catImage.imageUrl),
        Text(catImage.name),
      ],
    );
  }
}
