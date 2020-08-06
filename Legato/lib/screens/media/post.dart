import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Post extends StatelessWidget {
  Map<String, dynamic> data;
  Post(this.data);

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
                          data["title"],
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
            SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.hardEdge,
              child: Container(
                margin: EdgeInsets.only(top: 0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: getAudioCard(context, data),
                    ),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget getAudioCard(BuildContext context, Map<String, dynamic> doc) {
    String link = data["link"];

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
