import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/splashbg.JPG'))),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Image.asset('assets/logo.JPG'),
                    Text('See best shots from people all around the world!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.blueGrey))
                  ],
                ),
              ),
            ),
            Container(
              height: 70,
              width: 200,
              padding: EdgeInsets.only(left: 25, right: 10),
              margin: EdgeInsets.symmetric(vertical: 70),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.cyan.shade300,
                    child: Icon(Icons.arrow_forward, size: 30),
                  )
                ],
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
