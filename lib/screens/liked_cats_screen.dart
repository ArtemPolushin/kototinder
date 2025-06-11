import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../di/locator.dart';
import '../model/cat_image.dart';
import '../model/liked_cat_image.dart';
import '../states/cats_state.dart';
import 'detail_screen.dart';

class LikedCatsScreen extends StatelessWidget {
  const LikedCatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final catsState = getIt<CatsState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Liked Cats'),
        centerTitle: true,
        actions: [
          ListenableBuilder(
            listenable: catsState,
            builder: (context, _) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    borderRadius: BorderRadius.circular(12),
                    icon: const Icon(Icons.filter_alt_rounded),
                    hint: Text(catsState.filterBreed ?? 'All breeds'),
                    value: catsState.filterBreed,
                    onChanged: (String? newValue) {
                      catsState.setFilterBreed(newValue);
                    },
                    items: [
                      DropdownMenuItem<String>(
                        value: null,
                        child: Text('All breeds'),
                      ),
                      ...catsState.breeds.map<DropdownMenuItem<String>>((
                        String value,
                      ) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: catsState,
        builder: (context, _) {
          final catsToShow = catsState.likedCats;

          if (catsToShow.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border_rounded, size: 64),
                  const SizedBox(height: 16),
                  Text(
                    catsState.filterBreed == null
                        ? 'You haven\'t liked any cats yet'
                        : 'No cats of this breed',
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: catsToShow.length,
            itemBuilder: (context, index) {
              final cat = catsToShow[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildCatCard(context, catsState, cat),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildCatCard(
    BuildContext context,
    CatsState catsState,
    LikedCatImage cat,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => DetailScreen(
                      catImage: CatImage(
                        imageUrl: cat.imageUrl,
                        name: cat.name,
                        description: cat.description,
                      ),
                    ),
              ),
            ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(12),
                  ),
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: CachedNetworkImage(
                      imageUrl: cat.imageUrl,
                      fit: BoxFit.cover,
                      placeholder:
                          (context, url) => Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                      errorWidget:
                          (context, url, error) =>
                              Center(child: Icon(Icons.error_outline_rounded)),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cat.name),
                        const SizedBox(height: 8),
                        Text(
                          'Liked at ${DateFormat('dd.MM.yyyy HH:mm').format(cat.likeTime)}',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 4,
              right: 4,
              child: IconButton(
                icon: Icon(Icons.delete_outline_rounded),
                onPressed: () {
                  catsState.removeCat(cat.imageUrl);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Removed ${cat.name}'),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
