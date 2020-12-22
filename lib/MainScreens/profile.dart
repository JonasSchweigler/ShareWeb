import 'package:shareweb/StartScreens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shareweb/views/create_ad.dart';
import 'package:shareweb/StartScreens/welcome.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
            centerTitle: true,
            backgroundColor: Colors.black12,
            leading: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateAd()));
              },
              child: Icon(Icons.add),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  _scaffoldKey.currentState.openEndDrawer();
                },
              )
            ],
          ),
          preferredSize: Size.fromHeight(80)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      endDrawer: Drawer(
          child: ListView(
        children: [
          FlatButton(
              child: Text('Abmelden'),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomePage()),
                );
              })
        ],
      )),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        // child: Column(
        //   children: <Widget>[
        //     Text(
        //       "Kontostand" + kontoStand + "€",
        //       style: new TextStyle(fontSize: 15),
        //     ),
        //     Text(
        //       "Statistik: ",
        //       style: new TextStyle(
        //         fontSize: 20,
        //         height: 2,
        //       ),
        //     ),
        /*Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 50),
                  child: Text(
                    "Umfragen: " + umFragen + "€",
                    style: new TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),*/
        // ],
        // ),
      ),
    );
  }
}
