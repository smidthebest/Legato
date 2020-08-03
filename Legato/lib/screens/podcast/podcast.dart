import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Podcast extends StatefulWidget {
  Map<String, dynamic> data;
  Podcast(this.data);

  _Podcast createState() => _Podcast(data);
}

class _Podcast extends State<Podcast> {
  Map<String, dynamic> data;
  _Podcast(this.data);
  int indicator;
  AudioPlayer ap = new AudioPlayer();
  int length = -1;

  initState() {
    super.initState();
    String link = data["link"];
    ap.setUrl(link).then((value) {
      ap.onDurationChanged.listen((Duration d) {
        length = d.inMilliseconds;
      });
      length = value;
      ap.onAudioPositionChanged.listen((Duration p) {
        setState(() {
          indicator = p.inMilliseconds;
        });
      });
    });
  }

  dispose() {
    super.dispose();
    ap.dispose();
  }

  Future<int> _getDuration() async {
    int duration =
        await Future.delayed(Duration(seconds: 0), () => ap.getDuration());
    debugPrint('duration$duration');

    return duration;
  }

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
                    // Positioned(
                    //   bottom: 20,
                    //   right: 20,
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         height: 35,
                    //         width: 35,
                    //         decoration: BoxDecoration(
                    //           color: Colors.white.withOpacity(0.5),
                    //           borderRadius: BorderRadius.circular(5),
                    //         ),
                    //         child: Center(
                    //           child: Icon(Icons.share),
                    //         ),
                    //       ),
                    //       Container(
                    //         height: 35,
                    //         margin: EdgeInsets.only(left: 10),
                    //         width: 35,
                    //         decoration: BoxDecoration(
                    //           color: Colors.white.withOpacity(0.5),
                    //           borderRadius: BorderRadius.circular(5),
                    //         ),
                    //         child: Center(
                    //           child: Icon(Icons.favorite_border),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )
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
    return Container(
        child: Column(
      children: [
        Row(children: [
          FlatButton(
            child: Icon(Icons.play_arrow),
            onPressed: () async {
              int restul = await ap.resume();
            },
          ),
          FlatButton(
            child: Icon(Icons.pause),
            onPressed: () async {
              int result = await ap.pause();
            },
          ),
          FlatButton(
            child: Icon(Icons.replay_10),
            onPressed: () async {
              int cur = await ap.getCurrentPosition();
              int result = await ap.seek(Duration(milliseconds: cur - 10000));
            },
          ),
          FlatButton(
            child: Icon(Icons.forward_10),
            onPressed: () async {
              int cur = await ap.getCurrentPosition();
              int result = await ap.seek(Duration(milliseconds: cur + 10000));
            },
          )
        ]),
        Slider(
          value: length < 0 ? 0 : indicator / length,
          onChanged: (val) async {
            print(val);
            print(length);
            double ans = val * length;
            print("The User changed it to " + ans.toString());
            int result = await ap.seek(Duration(milliseconds: ans.round()));
            setState(() {
              indicator = ans.round();
            });
          },
        )
      ],
    ));
  }
}
