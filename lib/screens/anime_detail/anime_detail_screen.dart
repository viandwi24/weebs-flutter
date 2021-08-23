import 'package:flutter/material.dart';
import 'package:weebs/constant.dart';

class AnimeDetailScreen extends StatefulWidget {
  const AnimeDetailScreen({
    Key key,
    @required this.id
  }) : super(key: key);
  final int id;

  @override
  _AnimeDetailScreenState createState() => _AnimeDetailScreenState(id: this.id);
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
  int id;
  bool showCover = true;
  final String title = 'Hige wo Soru. Soshite Joshikosei wo Hirou.';
  final String cover = 'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx114232-2rm50ZD1cQgP.jpg';
  final String bg = 'https://s4.anilist.co/file/anilistcdn/media/manga/cover/large/nx104505-R5GadGxArOAe.jpg';
  final String description = "Yoshida is just your average salaryman, drowning his tears in booze. On his way home one night, he finds a runaway high school girl sitting on the street. She offers to sleep with him in exchange for a place to stay―and Yoshida lets her off the hook and offers her work instead. A rom-com between the most unbalanced couple you'll ever find!";
  final double rank = 7.3;
  final int eps = 12;
  final String status = 'On-Going';
  final List galery = [
    'https://s4.anilist.co/file/anilistcdn/character/large/n127924-2OtEfITDAIWb.jpg',
    'https://s4.anilist.co/file/anilistcdn/character/large/b127925-i0JAx5K81uDQ.png',
    'https://s4.anilist.co/file/anilistcdn/character/large/b127927-01NPFsYdHU7u.png',
    'https://s4.anilist.co/file/anilistcdn/character/large/n127928-kcgBHwZknzmD.jpg',
  ];

  _AnimeDetailScreenState({
    @required this.id
  });

  @override
  Widget build(BuildContext context) {
    final double maxWidth = MediaQuery.of(context).size.width;
    final double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
       backgroundColor: kBackgroundColor,
       body: Stack(
         children: [
            SizedBox(
              width: maxWidth,
              height: maxHeight * .45,
              child: Container(
                child: ClipRRect(
                  child: Image.network(this.bg, fit: BoxFit.cover),
                ),
              ),
            ),
            Container(
              width: maxWidth,
              height: maxHeight * .45,
              color: Colors.black.withOpacity(.3),
            ),
            SizedBox.expand(
              child: NotificationListener<DraggableScrollableNotification>(
                onNotification: (notification) {
                  final tolerance = 0.010;
                  bool result = true;
                  if (notification.extent > notification.minExtent+tolerance) {
                    result = false;
                  }
                  setState(() => showCover = result);
                  return true;
                },
                child: DraggableScrollableSheet(
                  minChildSize: .6,
                  initialChildSize: .6,
                  maxChildSize: .9,
                  builder: (BuildContext context, ScrollController scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Container(
                          padding: EdgeInsets.all(25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: (maxWidth / 3) / 3),
                              Container(
                                width: (maxWidth - (10 * 2)).toDouble(),
                                child: Text(
                                  this.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(1.0, 1.0),
                                        blurRadius: 5.0,
                                        color: Colors.grey[200],
                                      ),
                                    ]
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    ShorcutWidgetText(
                                      title: 'Episode',
                                      value: Row(
                                        children: [
                                          Text(
                                            this.eps.toString(),
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ShorcutWidgetText(
                                      title: 'Rank',
                                      value: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 18,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            this.rank.toString(),
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                        ],
                                      ),
                                    ),
                                    ShorcutWidgetText(
                                      title: 'Status',
                                      value: Text(
                                        this.status,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                child: Text(
                                  this.description,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.only(left: 20, bottom: 5),
                                child: Text(
                                  'Character',
                                  style: kTitleStyle,
                                ),
                              ),
                              Container(
                                height: 100,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: this.galery.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      margin: EdgeInsets.only(left: 10, right: (index == this.galery.length-1) ? 10 : 0),
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.network(this.galery[index], fit: BoxFit.cover),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            (showCover) ? Positioned(
              top: maxHeight * .30,
              left: 25,
              child: Container(
                width: maxWidth / 3,
                height: maxWidth / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x54000000),
                      spreadRadius:4,
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: ClipRRect(
                  child: Image.network(cover, fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ) : Container(),
            SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: RawMaterialButton(
                      onPressed: () => Navigator.pop(context),
                      elevation: 5.0,
                      fillColor: kBackgroundColor,
                      child: Icon(
                        Icons.chevron_left,
                        size: 24.0,
                        color: Colors.grey[700],
                      ),
                      padding: EdgeInsets.all(5.0),
                      shape: CircleBorder(),
                    ),
                  ),
                ]
              )
            ),
         ],
       ),
    );
  }
}


class ShorcutWidgetText extends StatelessWidget {
  const ShorcutWidgetText({
    Key key,
    @required this.title,
    @required this.value,
  }) : super(key: key);

  final String title;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            this.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          this.value,
        ],
      ),
    );
  }
}