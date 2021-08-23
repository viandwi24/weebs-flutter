import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weebs/screens/anime_detail/anime_detail_screen.dart';

class AnimeCard extends StatelessWidget {
  const AnimeCard({
    Key key,
    @required this.title,
    @required this.cover,
    @required this.eps,
    @required this.genre,
    this.width = 250,
    this.height = 250,
  }) : super(key: key);

  final double width;
  final double height;
  final String title;
  final String cover;
  final String genre;
  final int eps;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AnimeDetailScreen(id: 1)));
      },
      child: Container(
        width: this.width,
        height: this.height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          child: Stack(
            children: [
              Container(
                width: this.width,
                height: this.height,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(cover, fit: BoxFit.cover),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: (this.width - (10 * 2)).toDouble(),
                        child: Text(
                          title,
                          // overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey[100],
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            shadows: [
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 5.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ]
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      AnimeCardLabel(text: this.genre),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(top: 15, right: 15),
                  child: AnimeCardLabel(text: 'Eps $eps')
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimeCardLabel extends StatelessWidget {
  const AnimeCardLabel({Key key, @required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200].withOpacity(0.90),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12
        ),
      ),
    );
  }
}