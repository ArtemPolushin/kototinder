import 'package:flutter/material.dart';
import '../di/locator.dart';
import '../states/cats_state.dart';
import 'detail_screen.dart';
import '../widgets/buttons_widget.dart';
import '../widgets/cat_image_widget.dart';
import 'liked_cats_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final catsState = getIt<CatsState>();
    return ListenableBuilder(
      listenable: catsState,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Kototinder'),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: catsState.fetchNewCat,
              ),
              IconButton(
                icon: const Icon(Icons.favorite),
                onPressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LikedCatsScreen(),
                      ),
                    ),
              ),
            ],
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child:
                        catsState.currentCat == null
                            ? const Center(child: CircularProgressIndicator())
                            : GestureDetector(
                              onTap:
                                  catsState.currentCat != null
                                      ? () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => DetailScreen(
                                                catImage: catsState.currentCat!,
                                              ),
                                        ),
                                      )
                                      : null,
                              onHorizontalDragEnd: (details) {
                                if (details.primaryVelocity! > 0) {
                                  catsState.likeCat();
                                } else if (details.primaryVelocity! < 0) {
                                  catsState.dislikeCat();
                                }
                                catsState.fetchNewCat();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: CatImageWidget(
                                        catImage: catsState.currentCat!,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                  ),
                  ButtonsWidget(
                    onLike: () {
                      catsState.likeCat();
                      catsState.fetchNewCat();
                    },
                    onDisLike: () {
                      catsState.dislikeCat();
                      catsState.fetchNewCat();
                    },
                    counterDislikes: catsState.dislikes,
                    counterLikes: catsState.likes,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
