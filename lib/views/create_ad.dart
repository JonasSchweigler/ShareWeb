import 'package:flutter/material.dart';
import 'home.dart';

class CreateAd extends StatefulWidget {
  @override
  _CreateAdState createState() => _CreateAdState();
}

class _CreateAdState extends State<CreateAd> {
  String authorName;
  String title;
  String desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black12,
            title: Text(
              "Betrieb Veröffentlichen",
              style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                    width: MediaQuery.of(context).size.width,
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          decoration: InputDecoration(hintText: "Name"),
                          onChanged: (val) {
                            authorName = val;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          decoration: InputDecoration(hintText: "Titel"),
                          onChanged: (val) {
                            title = val;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 20,
                          right: 20,
                          bottom: 40,
                        ),
                        child: TextField(
                          decoration: InputDecoration(hintText: "Beschreibung"),
                          onChanged: (val) {
                            desc = val;
                          },
                        ),
                      ),
                      // publish.publishButton(() {
                      //   setState(() {
                      //     publish.ads.add(
                      //       Padding(
                      //         padding: EdgeInsets.all(20.0),
                      //         child: Container(
                      //           child: Text(
                      //             'hello',
                      //           ),
                      //           width: double.infinity,
                      //           height: 70,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(10),
                      //             color: Colors.teal,
                      //           ),
                      //         ),
                      //       ),
                      //     );
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => HomePage(),
                      //       ),
                      //     );
                      //   });
                      // }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
