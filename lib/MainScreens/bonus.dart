import 'package:flutter/material.dart';
import 'package:shareweb/widgets/recent_orders.dart';
import 'package:shareweb/utilities/data/data.dart';
import 'package:shareweb/views/cart_screen.dart';

class BonusPage extends StatefulWidget {
  @override
  _BonusPageState createState() => _BonusPageState();
}

class _BonusPageState extends State<BonusPage> {
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
        preferredSize: Size.fromHeight(65),
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
                  builder: (_) => CartScreen(),
                ),
              ),
            ),
          ),
        ],
      )),
      body: RecentOrders(),
    );
  }
}
