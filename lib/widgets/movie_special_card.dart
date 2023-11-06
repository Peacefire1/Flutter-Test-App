import 'package:flutter/material.dart';
import 'package:movie/model/movie/index.dart';
import 'package:movie/screens/movie_detial.dart';

class MovieSpecialCard extends StatelessWidget {
  final MovieModel data;
  MovieSpecialCard(this.data, {super.key});

  void _onCardTap(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => MovieDetialPage(data)));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => _onCardTap(context),
      child: Container(
        height: 200,
        width: size.width * 0.4,
        margin: EdgeInsets.only(right: 10, left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: NetworkImage(data.imgUrl), fit: BoxFit.fill)),
        child: Icon(
          Icons.play_circle,
          color: Colors.grey.withOpacity(0.8),
          size: 56,
        ),
      ),
    );
  }
}
