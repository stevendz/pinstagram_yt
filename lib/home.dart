import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'main.dart';

class Pinstagram extends StatefulWidget {
  @override
  _PinstagramState createState() => _PinstagramState();
}

class _PinstagramState extends State<Pinstagram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 35),
              _getLogo(),
              _getUsers(),
              _getPosts(),
            ],
          ),
          _getCustomNavBar()
        ],
      ),
    );
  }
}

_getLogo() {
  return Container(
    height: 50,
    child: Image.asset('assets/logo.JPG'),
  );
}

_getUsers() {
  return Container(
    margin: EdgeInsets.fromLTRB(10, 10, 0, 20),
    height: 70,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return index == 0
            ? Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      radius: 31,
                      backgroundImage: AssetImage('assets/pangyuhao.jpg'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(3),
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        topLeft: Radius.circular(3),
                      ),
                      boxShadow: [
                        BoxShadow(color: Colors.white, spreadRadius: 2),
                      ],
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 20),
                  )
                ],
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor:
                      users[index].newPost ? Colors.blueAccent : Colors.white,
                  child: CircleAvatar(
                    radius: 33,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 31,
                      backgroundImage: users[index - 1].img,
                    ),
                  ),
                ),
              );
      },
    ),
  );
}

_getPosts() {
  return Expanded(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: posts[posts.length - index - 1].avatar,
                    ),
                    SizedBox(width: 10),
                    Text(posts[index].name)
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            fit: BoxFit.cover, image: posts[index].img)),
                  ),
                ),
                SizedBox(height: 10),
                Row(children: <Widget>[
                  Icon(Icons.favorite, color: posts[index].isLiked ? Colors.redAccent : Colors.blueGrey.shade300),
                  Icon(Icons.mode_comment, color: Colors.blueGrey.shade300),
                  Icon(Icons.reply, color: Colors.blueGrey.shade300),
                  Expanded(child: Container()),
                  Icon(Icons.more_horiz, color: Colors.blueGrey.shade300),
                ],)
              ],
            ),
          );
        },
        staggeredTileBuilder: (int index) {
          return StaggeredTile.count(2, posts[index].height);
        },
        crossAxisSpacing: 8,
      ),
    ),
  );
}

_getCustomNavBar(){
  return Container(
    height: 100,
    padding: EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white.withOpacity(0),
          Colors.white.withOpacity(0.75),
          Colors.white.withOpacity(1),
          Colors.white.withOpacity(1),
        ]
      ),
      
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Icon(Icons.dashboard, color: Colors.blueAccent, size: 35),
        Icon(Icons.search, color: Colors.blueGrey, size: 30),
        Icon(Icons.person, color: Colors.blueGrey, size: 30),
        Container(
          width: 70,
          height: 70,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ) 
          ),
          child: CircleAvatar(
            backgroundColor: Colors.blueAccent.shade100,
            child: CircleAvatar(
              radius: 13,
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        )
      ],
    ),
  );
}