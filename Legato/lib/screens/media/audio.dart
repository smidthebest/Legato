import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Audio extends StatefulWidget {
  @override
  _Audio createState() => _Audio();
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
                                      children: [Post(), Post()],
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

  Widget getAudioCard(BuildContext context, DocumentSnapshot doc) {
    String link = doc.data["link"];
    return Container(
      width: 200,
      color: Colors.red,
      child: Text(link),
    );
  }
}

class Post extends StatelessWidget {
  const Post({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      color: Colors.yellow,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Arnav Reddy",
                          style: TextStyle(
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "2 mins ago",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.settings_input_composite,
                  size: 30,
                )
              ],
            ),
            Container(
              height: 200,
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Icon(Icons.share),
                          ),
                        ),
                        Container(
                          height: 35,
                          margin: EdgeInsets.only(left: 10),
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Icon(Icons.favorite_border),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
