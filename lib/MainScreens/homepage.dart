import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shareweb/utilities/data/data.dart';
import 'package:shareweb/utilities/models/restaurant.dart';
import 'package:shareweb/views/cart_screen.dart';
import 'package:shareweb/views/restaurant_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shareweb/utilities/services/location.dart';
import 'package:geocoding/geocoding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Gastronomie restaurant = Gastronomie();
Adress _adress = Adress();

class HomePagePage extends StatefulWidget {
  @override
  _HomePagePageState createState() => _HomePagePageState();
}

class _HomePagePageState extends State<HomePagePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  double longitude;
  double latitude;

  void getPosition() {
    longitude = _adress.longitude;
    latitude = _adress.latitude;
    print(longitude.toString());
    print(latitude.toString());
    // List<Placemark> placemarks =
    //     await placemarkFromCoordinates(latitude, longitude);
    // print('This is the adress: $placemarks');
  }

  @override
  void initState() {
    super.initState();
    try {
      getPosition();
    } catch (e) {
      print(e);
    }
  }

  _buildRestaurants({
    String providerName,
    String imageURL,
    String adress,
    String providerType,
  }) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => RestaurantScreen(
            restaurant: restaurant,
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            width: 1.0,
            color: Colors.grey[200],
          ),
        ),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Hero(
                tag: imageURL,
                child: Image(
                  height: 150.0,
                  width: 150.0,
                  image: AssetImage(imageURL),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      providerName,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    // RatingStars(null),
                    SizedBox(height: 4.0),
                    Text(
                      providerType,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      adress,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(QuerySnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.docs.length,
      itemBuilder: (context, index) {
        final doc = snapshot.docs[index];
        return _buildRestaurants(
          adress: doc["adress"],
          imageURL: doc["imageURL"],
          providerName: doc["providerName"],
          providerType: doc["providerType"],
        );
      },
    );
  }

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
        preferredSize: Size.fromHeight(65),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal[400],
              ),
              child: Text(
                'Drawer Header',
                style: GoogleFonts.shadowsIntoLight(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 5,
                top: 8,
                bottom: 8,
                right: 100,
              ),
              child: FlatButton(
                child: Text(
                  'Orders (${currentUser.cart.length})',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CartScreen(),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 5,
                top: 8,
                bottom: 8,
                right: 100,
              ),
              child: FlatButton(
                  child: Text(
                    'update Location',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      try {
                        getPosition();
                      } catch (e) {
                        print(e);
                      }
                    });
                  }),
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Providers").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              !snapshot.hasError &&
              snapshot.connectionState != ConnectionState.waiting) {
            return _buildList(snapshot.data);
          } else {
            return Center(
              child: SpinKitDualRing(
                color: Colors.white,
                size: 100.0,
              ),
            );
          }
        },
      ),
    );
  }
}
