import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weebs/screens/components/card.dart';
import 'package:weebs/constant.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<AnimeCard> _listPopularAnime = [
    AnimeCard(
      title: 'Hige wo Soru. Soshite Joshikousei wo Hirou.',
      cover: 'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx114232-2rm50ZD1cQgP.jpg',
      eps: 4,
      genre: 'Romance',
    ),
    AnimeCard(
      title: 'Osananajimi ga Zettai ni Makenai Love Come',
      cover: 'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx124675-fNI06ipb65vy.jpg',
      eps: 2,
      genre: 'Romance',
    ),
    AnimeCard(
      title: 'Ore no Kanojo to Osananajimi ga Shuraba Sugiru',
      cover: 'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx14749-aq6aPtIPPVOY.png',
      eps: 13,
      genre: 'Romance',
    ),
  ];
  List<AnimeCard> _listPreviousSeason = [
    AnimeCard(
      title: 'Tonikaku Kawaii',
      cover: 'https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/b116267-JArFvMYRdnbd.jpg',
      eps: 13,
      genre: 'Romance',
    ),
    AnimeCard(
      title: 'Kamisama ni Natta Hi',
      cover: 'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx118419-li8RpQcLgiKK.png',
      eps: 12,
      genre: 'Drama',
    ),
    AnimeCard(
      title: 'Akudama Drive',
      cover: 'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx116566-6qREQAAfbEDi.jpg',
      eps: 12,
      genre: 'Action'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(25),
                child: Text(
                  'Popular Anime',
                  style: kTitleStyle,
                ),
              ),
              Container(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _listPopularAnime.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(left: 20, right: (index == _listPopularAnime.length-1) ? 20 : 0),
                      child: AnimeCard(
                        title: _listPopularAnime[index].title,
                        cover: _listPopularAnime[index].cover,
                        eps: _listPopularAnime[index].eps,
                        genre: _listPopularAnime[index].genre,
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(25),
                child: Text(
                  'Previous Season',
                  style: kTitleStyle,
                ),
              ),
              for (AnimeCard item in _listPreviousSeason) Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: AnimeCard(
                  title: item.title,
                  cover: item.cover,
                  eps: item.eps,
                  genre: item.genre,
                  width: (MediaQuery.of(context).size.width - (25 * 2)),
                  height: 180,
                ),
              ),
            ],
          ),
        ),
      );
  }
}