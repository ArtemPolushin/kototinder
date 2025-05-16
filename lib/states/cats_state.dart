import 'package:flutter/material.dart';
import '../api/cat_api.dart';
import '../model/cat_image.dart';
import '../model/liked_cat_image.dart';

class CatsState extends ChangeNotifier {
  final List<LikedCatImage> _likedCats = [];
  CatImage? _currentCat;
  int _likes = 0;
  int _dislikes = 0;
  String? _filterBreed;

  CatImage? get currentCat => _currentCat;
  int get likes => _likes;
  int get dislikes => _dislikes;
  String? get filterBreed => _filterBreed;

  CatsState() {
    fetchNewCat();
  }

  void setCurrentCat(CatImage? cat) {
    _currentCat = cat;
    notifyListeners();
  }

  void likeCat() {
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
    }
    notifyListeners();
  }

  void dislikeCat() {
    _dislikes++;
    notifyListeners();
  }

  void fetchNewCat() async {
    setCurrentCat(await CatApi().fetchCatImage());
    notifyListeners();
  }

  List<LikedCatImage> get likedCats {
    if (_filterBreed == null) return _likedCats;
    return _likedCats.where((cat) => cat.name == _filterBreed).toList();
  }

  List<String> get breeds {
    return _likedCats.map((cat) => cat.name).toSet().toList();
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
