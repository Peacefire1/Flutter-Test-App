import 'package:flutter/material.dart';
import 'package:movie/model/movie/index.dart';
import 'package:movie/screens/movie_detial.dart';

class MovieCard extends StatelessWidget {
  final MovieModel data;
  MovieCard(this.data, {super.key});

  void _onCardTap(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => MovieDetialPage(data)));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 3 - 20;

    return InkWell(
      onTap: () => _onCardTap(context),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            width: width,
            height: width * 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(data.imgUrl), fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: width,
            child: Text(
              data.title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
