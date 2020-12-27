import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shareweb/utilities/data/data.dart';
import 'package:shareweb/utilities/models/restaurant.dart';
import 'package:shareweb/views/cart_screen.dart';
import 'package:shareweb/views/restaurant_screen.dart';
import 'package:shareweb/views/create_ad.dart';
import 'package:shareweb/widgets/rating_stars.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shareweb/utilities/services/location.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shareweb/views/create_ad.dart';
import 'package:shareweb/utilities/data/database.dart';

Gastronomie restaurant = Gastronomie();
Adress _adress = Adress();

class HomePagePage extends StatefulWidget {
  @override
  _HomePagePageState createState() => _HomePagePageState();
}

class _HomePagePageState extends State<HomePagePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _firebaseRef;

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
    _firebaseRef = FirebaseDatabase().reference().child('Provider');
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
          builder: (_) => RestaurantScreen(restaurant: restaurant),
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
              child: (dataBase.imageUrl != null)
                  ? Hero(
                      tag: imageURL,
                      child: Image(
                        height: 150.0,
                        width: 150.0,
                        image: NetworkImage(imageURL),
                        fit: BoxFit.cover,
                      ),
                    )
                  : Hero(
                      tag: 'assets/images/Sweep.png',
                      child: Image(
                        height: 150.0,
                        width: 150.0,
                        image: AssetImage('assets/images/Sweep.png'),
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
                  'Bestellungen (${currentUser.cart.length})',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CartScreen(),
                  ),
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
      body: StreamBuilder(
        stream: _firebaseRef.onValue,
        builder: (context, snap) {
          if (snap.hasData &&
              !snap.hasError &&
              snap.data.snapshot.value != null) {
            Map providerdata = snap.data.snapshot.value;
            List item = [];

            providerdata.forEach(
                (index, data) => item.add({"Licence": index, ...data}));

            return
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                //       child: Text(
                //         'In deiner Nähe',
                //         style: TextStyle(
                //           fontSize: 24.0,
                //           fontWeight: FontWeight.w600,
                //           letterSpacing: 1.2,
                //         ),
                //       ),
                //     ),
                ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                return _buildRestaurants(
                  adress: item[index]['adress'],
                  imageURL: item[index]['imageURL'],
                  providerName: item[index]['providerName'],
                  providerType: item[index]['providerType'],
                );
              },
            );
            //   ],
            // );
          } else
            return Center(
              child: SpinKitDualRing(
                color: Colors.white,
                size: 100.0,
              ),
            );
        },
      ),
    );
  }
}
