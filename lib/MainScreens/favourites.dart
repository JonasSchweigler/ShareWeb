import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            flexibleSpace: Image(
              image: AssetImage('assets/images/steak.jpg'),
              fit: BoxFit.cover,
            ),
            centerTitle: true,
            backgroundColor: Colors.black12,
            title: Text(
              "Favourites",
              style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            ),
          ),
          preferredSize: Size.fromHeight(80)),
      body: Container(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
