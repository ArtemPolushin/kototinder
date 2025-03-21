import 'package:flutter/material.dart';
import '../api/cat_api.dart';
import 'detail_screen.dart';
import '../widgets/buttons_widget.dart';
import '../widgets/cat_image_widget.dart';
import '../model/cat_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CatImage? catImage;
  int counterDislikes = 0;
  int counterLikes = 0;

  @override
  void initState() {
    super.initState();
    _fetchCatImage();
  }

  Future<void> _fetchCatImage() async {
    setState(() {
      catImage = null;
    });

    final newCatImage = await CatApi().fetchCatImage();
    setState(() {
      catImage = newCatImage;
    });
  }

  void _incrementCounterLikes() {
    setState(() {
      counterLikes++;
    });
  }

  void _incrementCounterDislikes() {
    setState(() {
      counterDislikes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kototinder'),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: _fetchCatImage),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          catImage == null
              ? CircularProgressIndicator()
              : GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (BuildContext context) =>
                              DetailScreen(catImage: catImage!),
                    ),
                  );
                },
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity! > 0) {
                    _incrementCounterLikes();
                  } else if (details.primaryVelocity! < 0) {
                    _incrementCounterDislikes();
                  }
                  _fetchCatImage();
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: CatImageWidget(catImage: catImage!),
                ),
              ),
          ButtonsWidget(
            onLike: () {
              _incrementCounterLikes();
              _fetchCatImage();
            },
            onDisLike: () {
              _incrementCounterDislikes();
              _fetchCatImage();
            },
            counterDislikes: counterDislikes,
            counterLikes: counterLikes,
          ),
        ],
      ),
    );
  }
}
