import 'package:flutter/material.dart';
import 'package:movie/screens/movies.dart';
import 'package:movie/screens/profile.dart';
import 'package:movie/screens/wishlist.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;
  final List<Widget> _totalPage = [MoviesPage(), WishListPage(), ProfilePage()];

  void setCurrentIndex(int val) {
    setState(() {
      _currentIndex = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff36393f),
      body: SafeArea(child: _totalPage[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: setCurrentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "Movie",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
