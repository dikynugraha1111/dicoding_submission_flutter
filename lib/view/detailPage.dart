import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  DetailPage({required this.index});
  int index;
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _scrollController = ScrollController();
  bool isLove = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[200],
          child: Icon(
            isLove ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: () {
            setState(() {
              isLove = !isLove;
            });
          }),
      body: new SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                new Container(
                    width: MediaQuery.of(context).size.width,
                    height: 215.0,
                    decoration: new BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://foto.kontan.co.id/ZtqnsCKMUotw3laCVwL7crhni54=/smart/2021/01/04/112846091p.jpg"),
                            fit: BoxFit.cover))),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        FavoriteButton(),
                      ],
                    ),
                  ),
                ),
                //Judul
                Center(
                  child: Container(
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: Colors.white),
                    padding: EdgeInsets.symmetric(horizontal: 11.0),
                    margin: EdgeInsets.only(top: 190.0),
                    child: Text(
                      "Kopi Luwak Arabica",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 27.0,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins"),
                    ),
                  ),
                ),
              ],
            ),

            // Icon Detail
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.wine_bar),
                      SizedBox(height: 8.0),
                      Text("Pahit Strong"),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.access_time),
                      SizedBox(height: 8.0),
                      Text("12 Jam"),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      SizedBox(height: 8.0),
                      Text("Rp 5000")
                    ],
                  ),
                ],
              ),
            ),
            // Desc
            Container(
              padding: EdgeInsets.symmetric(vertical: 11.0),
              child: Text(
                "Description",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 21.0, left: 21.0, bottom: 100.0),
              child: Text(
                "Coffea arabica (/əˈræbɪkə/), also known as the Arabian coffee, 'coffee shrub of Arabia', 'mountain coffee' or 'arabica coffee', is a species of Coffea. It is believed to be the first species of coffee to be cultivated, and is the dominant cultivar, representing about 60% of global production.[2] Coffee produced from the (less acidic, more bitter, and more highly caffeinated) robusta bean (C. canephora) makes up most of the remaining coffee production. Arabica coffee originates from Ethiopia and was first cultivated in Yemen, and documented by the 12th century.[3][4] Coffea arabica is called ‏بُنّ‎ (būnn) in Arabic, borrowed from the Oromo Buna. ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14.0,
                    letterSpacing: 0.5,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400),
              ),
            ),
            // Image List
            // Container(
            //   height: 144.0,
            //   padding: EdgeInsets.only(bottom: 5.0),
            //   child: Scrollbar(
            //     controller: _scrollController,
            //     isAlwaysShown: true,
            //     child: new ListView.builder(
            //       controller: _scrollController,
            //       scrollDirection: Axis.horizontal,
            //       itemCount: widget.place.imageUrls.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Padding(
            //           padding: EdgeInsets.symmetric(horizontal: 5.0),
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(10.0),
            //             child: new Image.network(widget.place.imageUrls[index]),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.archive : Icons.archive_outlined,
        color: Colors.grey,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
