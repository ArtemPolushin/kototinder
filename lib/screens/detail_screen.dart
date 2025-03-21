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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.6,
            child: CatImageWidget(catImage: catImage),
          ),
          Text(catImage.description),
        ],
      ),
    );
  }
}
