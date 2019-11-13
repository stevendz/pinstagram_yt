import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinstagram/home.dart';
import 'package:pinstagram/splash.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class Post {
  String name;
  ImageProvider img;
  ImageProvider avatar;
  num height;
  bool isLiked;
  Post({this.name, this.height, this.img, this.avatar, this.isLiked});
}

List<Post> posts = [
  Post(
    name: 'Chester\nRay',
    height: 4,
    img: AssetImage('assets/1.jpg'),
    avatar: AssetImage('assets/face1.jpg'),
    isLiked: true,
  ),
  Post(
    name: 'Steve\nMichaels',
    height: 4.5,
    img: AssetImage('assets/2.jpg'),
    avatar: AssetImage('assets/face2.jpg'),
    isLiked: false,
  ),
  Post(
    name: 'Leona\nBarnes',
    height: 5,
    img: AssetImage('assets/3.jpg'),
    avatar: AssetImage('assets/face3.jpg'),
    isLiked: true,
  ),
  Post(
    name: 'Milton\nEstrada',
    height: 4,
    img: AssetImage('assets/4.jpg'),
    avatar: AssetImage('assets/face4.jpg'),
    isLiked: true,
  ),
  Post(
    name: 'Clarence\nMalone',
    height: 4,
    img: AssetImage('assets/5.jpg'),
    avatar: AssetImage('assets/face5.jpg'),
    isLiked: false,
  ),
  Post(
    name: 'Peter\nBanks',
    height: 4.7,
    img: AssetImage('assets/6.jpg'),
    avatar: AssetImage('assets/face6.jpg'),
    isLiked: false,
  ),
];

class User {
  ImageProvider img;
  bool newPost;
  User({this.img, this.newPost});
}

List<User> users = [
  User(
    img: AssetImage('assets/face1.jpg'),
    newPost: false,
  ),
  User(
    img: AssetImage('assets/face2.jpg'),
    newPost: true,
  ),
  User(
    img: AssetImage('assets/face3.jpg'),
    newPost: true,
  ),
  User(
    img: AssetImage('assets/face4.jpg'),
    newPost: false,
  ),
  User(
    img: AssetImage('assets/face5.jpg'),
    newPost: false,
  ),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageViewer(),
    );
  }
}

class PageViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        SplashScreen(),
        Pinstagram(),
      ],
    );
  }
}

