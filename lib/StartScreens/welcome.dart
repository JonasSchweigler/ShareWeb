import 'package:flutter/material.dart';
import 'package:shareweb/StartScreens/login.dart';
import 'package:shareweb/StartScreens/signup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _loginButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        width: 300,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.teal.withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.teal),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        width: 300,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.teal.withAlpha(100),
                offset: Offset(2, 4),
                blurRadius: 8,
                spreadRadius: 2)
          ],
          color: Colors.white,
        ),
        child: Text(
          'Register now',
          style: TextStyle(fontSize: 20, color: Colors.teal),
        ),
      ),
    );
  }

  /* - Fingerabruck, zur Zeit außer Nutzung, bei Nutzung auch
  Widget _label() {
    return Container(
        margin: EdgeInsets.only(top: 40, bottom: 20),
        child: Column(
          children: <Widget>[
            Text(
              'Quick login with Touch ID',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            SizedBox(
              height: 20,
            ),
            Icon(Icons.fingerprint, size: 90, color: Colors.white),
            SizedBox(
              height: 20,
            ),
            Text(
              'Touch ID',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ));
  } */

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'S',
        style: GoogleFonts.portLligatSans(
          textStyle: Theme.of(context).textTheme.display1,
          fontSize: 80,
          fontWeight: FontWeight.w700,
          color: Colors.tealAccent,
        ),
        children: [
          TextSpan(
            text: 'W',
            style: TextStyle(color: Colors.grey[800], fontSize: 80),
          ),
          TextSpan(
            text: 'EEP',
            style: TextStyle(color: Colors.tealAccent, fontSize: 80),
          ),
        ],
      ),
    );
  }

  Widget _underTitle() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: 20.0, height: 100.0),
        Text(
          "Get",
          style: TextStyle(fontSize: 30.0),
        ),
        SizedBox(width: 20.0, height: 100.0),
        RotateAnimatedTextKit(
            text: ["Happy", "Relaxed", "Cheep", "Just Sweep"],
            textStyle: TextStyle(fontSize: 30.0, fontFamily: "Horizon"),
            textAlign: TextAlign.start),
      ],
    );
  }

  // Widget _underTitle() {
  //   return Text(
  //     'Enjoy cheep with Swepp',
  //     style: GoogleFonts.portLligatSans(
  //       textStyle: Theme.of(context).textTheme.display1,
  //       fontSize: 30,
  //       fontWeight: FontWeight.w700,
  //       color: Colors.white,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.height,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blueGrey,
                    Colors.teal,
                  ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _title(),
              SizedBox(
                height: 25,
              ),
              Center(child: _underTitle()),
              SizedBox(
                height: 200,
              ),
              _loginButton(),
              SizedBox(
                height: 20,
              ),
              _signUpButton(),
              SizedBox(
                height: 100,
              ),
              //_label()
            ],
          ),
        ),
      ),
    );
  }
}
