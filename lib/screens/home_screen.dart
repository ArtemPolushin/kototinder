import 'package:flutter/material.dart';
import '../di/locator.dart';
import '../states/cats_state.dart';
import 'detail_screen.dart';
import '../widgets/buttons_widget.dart';
import '../widgets/cat_image_widget.dart';
import 'liked_cats_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CatsState catsState;
  bool _showSnackBar = true;

  @override
  void initState() {
    super.initState();
    catsState = getIt<CatsState>();
    _setupConnectivityListener();
  }

  void _setupConnectivityListener() {
    catsState.addListener(() {
      if (catsState.isOffline && _showSnackBar) {
        _showNetworkSnackBar('No internet connection', Colors.red);
        _showSnackBar = false;
      } else if (!catsState.isOffline && !_showSnackBar) {
        _showNetworkSnackBar('Internet onnection restored', Colors.green);
        _showSnackBar = true;
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      }
    });
  }

  void _showNetworkSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          left: 20,
          right: 20,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
      body: ListenableBuilder(
        listenable: catsState,
        builder: (context, _) {
          return Stack(
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
              if (catsState.isLoading)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }
}
