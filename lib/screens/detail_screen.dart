import 'package:flutter/material.dart';
import '../model/cat_image.dart';
import '../widgets/cat_image_widget.dart';

class DetailScreen extends StatelessWidget {
  final CatImage catImage;
  const DetailScreen({super.key, required this.catImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cat Details')),
      body: Column(
        children: [
          Expanded(
            child: InteractiveViewer(
              minScale: 0.25,
              maxScale: 4.0,
              child: CatImageWidget(catImage: catImage),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(catImage.description),
          ),
        ],
      ),
    );
  }
}
