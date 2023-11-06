import 'package:flutter/material.dart';
import 'package:movie/model/movie/index.dart';
import 'package:movie/providers/common.dart';
import 'package:provider/provider.dart';

class MovieDetialPage extends StatefulWidget {
  final MovieModel data;
  const MovieDetialPage(this.data, {super.key});

  @override
  State<MovieDetialPage> createState() => _MovieDetialPageState();
}

class _MovieDetialPageState extends State<MovieDetialPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!Provider.of<CommonProvider>(context, listen: false).isLoggedIn) {
        Provider.of<CommonProvider>(context, listen: false).changeCurrentIdx(2);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Please Log in"),
          ),
        );
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Consumer<CommonProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 33, 34, 37),
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      width: width,
                      height: width * 1.5,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            widget.data.imgUrl,
                            width: width,
                            fit: BoxFit.fitWidth,
                          ),
                          Container(
                            color: Colors.black.withOpacity(0.5),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.play_circle,
                                  color: Colors.grey.withOpacity(0.8),
                                  size: 60,
                                ),
                                SizedBox(
                                  height: 70,
                                ),
                                Text(
                                  widget.data.title,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "${widget.data.publishedYear} | ${widget.data.durationMin} | ${widget.data.type}",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 50,
                                )
                              ],
                            ),
                          ),
                          SafeArea(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: Icon(
                                    Icons.chevron_left,
                                    color: Colors.white,
                                    size: 50,
                                  )),
                            ),
                          ),
                          SafeArea(
                              child: Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () =>
                                  provider.addWishList(widget.data.id),
                              icon: Icon(
                                provider.isWishMovie(widget.data)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.data.description ?? "",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
