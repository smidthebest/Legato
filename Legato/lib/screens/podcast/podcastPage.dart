import 'package:Legato/screens/podcast/podcast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PodcastPage extends StatefulWidget {
  PodcastPage();

  @override
  _PodcastPage createState() => _PodcastPage();
}

class _PodcastPage extends State<PodcastPage> {
  _PodcastPage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoScrollbar(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            IntrinsicHeight(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: FittedBox(
                      child: Image(
                        image: AssetImage("assets/images/podcast.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(1000),
                        topRight: Radius.circular(1000),
                      ),
                      child: Container(
                        color: Colors.white,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('podcasts').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return new Text('Loading...');
                // return new Column(
                //   children: snapshot.data.documents
                //       .map((DocumentSnapshot document) {
                //     return Container();
                //   }).toList(),
                // );
                return Column(
                  children: getPodcasts(snapshot.data.documents),
                );
              },
            ),
            // IntrinsicHeight(
            //   child: ListTile(
            //     onTap: () {},
            //     leading: FittedBox(
            //       child: Image.asset("assets/images/podcast.png"),
            //       fit: BoxFit.fitHeight,
            //     ),
            //     title: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text(
            //           "Balaji on da stiks",
            //           style: TextStyle(fontWeight: FontWeight.bold),
            //         ),
            //         Text(
            //           "10 min • melodious",
            //           style: TextStyle(fontWeight: FontWeight.w300),
            //         ),
            //       ],
            //     ),
            //     trailing: Icon(Icons.arrow_forward_ios),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  getPodcasts(List<DocumentSnapshot> documents) {
    List<Widget> widgets = new List();
    for (DocumentSnapshot i in documents) {
      widgets.add(new Podcast(i.data));
      widgets.add(new SizedBox(height: 15));
    }
    return widgets;
  }
}
