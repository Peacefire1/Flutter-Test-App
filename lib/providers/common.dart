import 'package:flutter/material.dart';
import 'package:movie/model/movie/index.dart';

class CommonProvider extends ChangeNotifier {
  List<MovieModel> movies = [];
  List<int> wishListIds = [];
  int currentIdx = 0;
  bool isLoggedIn = false;

  void setMovies(List<MovieModel> data) {
    movies = data;
    notifyListeners();
  }

  bool isWishMovie(MovieModel data) {
    return wishListIds.any((element) => element == data.id);
  }

  void addWishList(int id) {
    if (wishListIds.contains(id)) {
      wishListIds.remove(id);
    } else {
      wishListIds.add(id);
    }
    notifyListeners();
  }

  List<MovieModel> get wishMovies => movies
      .where(
        (element) => isWishMovie(element),
      )
      .toList();

  void changeCurrentIdx(int idx) {
    currentIdx = idx;
    notifyListeners();
  }

  void onLogin() {
    isLoggedIn = true;
    notifyListeners();
  }

  void onLogOut() {
    isLoggedIn = false;
    notifyListeners();
  }
}
