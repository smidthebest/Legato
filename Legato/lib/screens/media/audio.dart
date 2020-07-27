import 'package:Legato/screens/media/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Audio extends StatefulWidget {
  @override
  State<Audio> createState() => _Audio();
}

class _Audio extends State<Audio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      resizeToAvoidBottomInset: false,
      body: Container(
        child: CupertinoScrollbar(
          child: ListView(
            children: [
              Stack(
                children: [
                  IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 15, left: 30, right: 30, bottom: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.satellite,
                                    color: Colors.white,
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Discover & ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Explore",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 30,
                              ),
                              Container(
                                color: Colors.orangeAccent,
                                child: field("search inspiration..."),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 30,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 40),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "MOST POPULAR",
                                      style: TextStyle(
                                        color: Colors.orangeAccent,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 3,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "RECENT",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                StreamBuilder<QuerySnapshot>(
                                  stream: Firestore.instance
                                      .collection('audio')
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (!snapshot.hasData)
                                      return new Text('Loading...');
                                    // return new Column(
                                    //   children: snapshot.data.documents
                                    //       .map((DocumentSnapshot document) {
                                    //     return Container();
                                    //   }).toList(),
                                    // );
                                    return Column(
                                      children:
                                          getPosts(snapshot.data.documents),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget field(String text) {
    return new Material(
      child: new Container(
        color: Colors.orangeAccent,
        child: new Container(
          padding: EdgeInsets.only(top: 1),
          child: new Center(
            child: new Column(
              children: [
                new TextFormField(
                  decoration: new InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    labelText: text,
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon:
                        Icon(Icons.search, size: 30, color: Colors.white),
                    prefix: null,
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    focusColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.white),
                    hoverColor: Colors.orangeAccent,
                    counterStyle: TextStyle(color: Colors.orangeAccent),
                  ),
                  keyboardType: TextInputType.text,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getPosts(List<DocumentSnapshot> documents) {
    List<Widget> widgets = new List();
    for (DocumentSnapshot i in documents) {
      widgets.add(new Post(i.data));
    }
    return widgets;
  }
}
