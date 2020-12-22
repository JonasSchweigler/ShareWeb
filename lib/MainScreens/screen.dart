import 'package:flutter/material.dart';
import 'package:shareweb/utilities/data/data.dart';
import 'package:shareweb/screens/cart_screen.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        child: AppBar(
          flexibleSpace: Image(
            image: AssetImage('assets/images/Sweep.png'),
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.teal,
          leading: IconButton(
            icon: Icon(Icons.more_horiz_rounded),
            iconSize: 40.0,
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
        ),
        preferredSize: Size.fromHeight(80),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 5,
                top: 8,
                bottom: 8,
                right: 100,
              ),
              child: FlatButton(
                child: Text(
                  'Bestellungen (${currentUser.cart.length})',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(width: 0.8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  width: 0.8,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              hintText: 'Anbieter oder Standort eingeben',
              prefixIcon: Icon(
                Icons.search,
                size: 30.0,
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
