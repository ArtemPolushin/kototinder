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
        CachedNetworkImage(
          imageUrl: catImage.imageUrl,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Error: $error\nImage url: ${catImage.imageUrl}',
                  ),
                ),
              );
            });
            return Icon(Icons.error);
          },
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 8),
        Text(catImage.name),
      ],
    );
  }
}
