import 'package:flutter/material.dart';
import '../api/cat_api.dart';
import '../model/cat_image.dart';
import '../model/liked_cat_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../database/database.dart';
import 'dart:math';

class CatsState extends ChangeNotifier {
  final AppDatabase _database;
  final CatApi _catApi;
  final Connectivity _connectivity;

  CatImage? _currentCat;
  int _likes = 0;
  int _dislikes = 0;
  String? _filterBreed;
  bool _isOffline = false;
  bool _isLoading = false;
  final _random = Random();

  CatImage? get currentCat => _currentCat;
  int get likes => _likes;
  int get dislikes => _dislikes;
  String? get filterBreed => _filterBreed;
  bool get isOffline => _isOffline;
  bool get isLoading => _isLoading;

  List<LikedCatImage> _likedCats = [];
  List<LikedCatImage> get likedCats {
    if (_filterBreed == null) return _likedCats;
    return _likedCats.where((cat) => cat.name == _filterBreed).toList();
  }

  List<String> get breeds {
    return _likedCats.map((cat) => cat.name).toSet().toList();
  }

  CatsState(this._database, this._catApi, this._connectivity) {
    _init();
  }

  Future<void> _init() async {
    await _checkConnectivity();
    _connectivity.onConnectivityChanged.listen((result) {
      _updateConnectionStatus(result.contains(ConnectivityResult.none));
    });
    await _loadInitialData();
  }

  Future<void> _checkConnectivity() async {
    final List<ConnectivityResult> connectivityResult =
        await (_connectivity.checkConnectivity());
    bool result = connectivityResult.contains(ConnectivityResult.none);
    _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(bool result) {
    if (_isOffline != result) {
      _isOffline = result;
      notifyListeners();
    }
  }

  Future<void> _loadInitialData() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _loadLikedCatsFromDb();

      var stats = await _database.getStats();
      _likes = stats.likes;
      _dislikes = stats.dislikes;
      await fetchNewCat();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _loadLikedCatsFromDb() async {
    final dbCats = await _database.getLikedCats();
    _likedCats =
        dbCats
            .map(
              (cat) => LikedCatImage(
                imageUrl: cat.imageUrl,
                name: cat.name,
                description: cat.description,
                likeTime: cat.likeTime,
              ),
            )
            .toList();
    notifyListeners();
  }

  Future<void> fetchNewCat() async {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      if (!_isOffline) {
        final newCat = await _catApi.fetchCatImage();
        await _database.insertCat(
          Cat(
            imageUrl: newCat.imageUrl,
            name: newCat.name,
            description: newCat.description,
          ),
        );
        _setCurrentCat(newCat);
      } else {
        await _showRandomCachedCat();
      }
    } catch (e) {
      if (!await _showRandomCachedCat()) {
        _setCurrentCat(null);
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> _showRandomCachedCat() async {
    final cachedCats = await _database.getAllCats();
    if (cachedCats.isEmpty) return false;

    final randomCat = cachedCats[_random.nextInt(cachedCats.length)];
    _setCurrentCat(
      CatImage(
        imageUrl: randomCat.imageUrl,
        name: randomCat.name,
        description: randomCat.description,
      ),
    );
    return true;
  }

  void _setCurrentCat(CatImage? cat) {
    _currentCat = cat;
    notifyListeners();
  }

  Future<void> likeCat() async {
    if (_currentCat != null) {
      var cat = _currentCat!;
      _likes++;
      _likedCats.add(
        LikedCatImage(
          imageUrl: cat.imageUrl,
          name: cat.name,
          description: cat.description,
          likeTime: DateTime.now(),
        ),
      );
      _database.updateLikes(_likes);
      _database.likeCat(
        LikedCat(
          imageUrl: cat.imageUrl,
          name: cat.name,
          description: cat.description,
          likeTime: DateTime.now(),
        ),
      );
    }
    notifyListeners();
  }

  Future<void> dislikeCat() async {
    _dislikes++;
    _database.updateDislikes(_dislikes);
    notifyListeners();
  }

  void removeCat(String imageUrl) {
    _likedCats.removeWhere((cat) => cat.imageUrl == imageUrl);
    if (!_likedCats.any((cat) => cat.name == _filterBreed)) {
      _filterBreed = null;
    }
    notifyListeners();
  }

  void setFilterBreed(String? breed) {
    _filterBreed = breed;
    notifyListeners();
  }
}
