import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Audio extends StatefulWidget {
  @override
  State<Audio> createState() => _Audio();
}

class _Audio extends State<Audio> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('audio').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');

        return new ListView(
          children: snapshot.data.documents.map((DocumentSnapshot document) {
            return getAudioCard(context, document);
          }).toList(),
        );
      },
    );
  }

  Widget getAudioCard(BuildContext context, DocumentSnapshot doc) {
    String link = doc.data["link"];

    // print(link);
    return YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(link),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      ),
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.blueGrey,
    );
  }
}
