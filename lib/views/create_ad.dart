import 'package:flutter/material.dart';
import 'package:shareweb/views/home.dart';
import 'package:shareweb/utilities/data/database.dart';

DataBase dataBase = DataBase();

class CreateAd extends StatefulWidget {
  @override
  _CreateAdState createState() => _CreateAdState();
}

class _CreateAdState extends State<CreateAd> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _adressController = TextEditingController();
  TextEditingController _providerController = TextEditingController();

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
              (dataBase.imageUrl != null)
                  ? Container(
                      child: Image.network(
                        dataBase.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(6)),
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            'No Image',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
              FlatButton(
                child: Text('upload Image'),
                color: Colors.green,
                onPressed: () => dataBase.uploadImage(),
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
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        controller: _providerController,
                        decoration: InputDecoration(
                          hintText: 'Anbietertyp',
                        ),
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
                        controller: _adressController,
                        decoration: InputDecoration(
                          hintText: 'Adresse',
                        ),
                      ),
                    ),
                    Padding(
                      child: FlatButton(
                        child: Text('new'),
                        color: Colors.red,
                        onPressed: () async {
                          // dataBaseService.newAd(
                          //   'adress',
                          //   'providerType',
                          //   'imageURL',
                          //   'providerName',
                          //   null,
                          // );
                          try {
                            await dataBase.addProvider(
                              adress: _adressController.text,
                              name: _nameController.text,
                              provider: _providerController.text,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HomePage(),
                              ),
                            );
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                      padding: EdgeInsets.all(8),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
