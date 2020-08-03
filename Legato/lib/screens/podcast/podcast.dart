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
  bool paused = true;

  initState() {
    super.initState();
    indicator = 0;
    String link = data["link"];
    ap.setUrl(link).then((value) {
      ap.onDurationChanged.listen((Duration d) {
        length = d.inMilliseconds;
      });

      ap.onAudioPositionChanged.listen((Duration p) {
        setState(() {
          indicator = p.inMilliseconds;
        });
      });
    });
  }

  dispose() {
    ap.dispose();
    super.dispose();
  }

  Future<int> _getDuration() async {
    int duration =
        await Future.delayed(Duration(seconds: 0), () => ap.getDuration());
    debugPrint('duration$duration');

    return duration;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          IntrinsicHeight(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () {},
              leading: FittedBox(
                child: Image.asset("assets/images/podcast.png"),
                fit: BoxFit.fitHeight,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Balaji on da stiks",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "10 min • melodious",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              trailing: GestureDetector(
                child: Icon(
                  paused ? Icons.play_arrow_rounded : Icons.pause,
                  size: 50,
                  color: Colors.orangeAccent,
                ),
                onTap: () async {
                  if (paused) {
                    await ap.resume();
                  } else {
                    await ap.pause();
                  }
                  setState(() {
                    paused = !paused;
                  });
                },
              ),
            ),
          ),
          getAudioCard(context, widget.data),
        ],
      ),
    );
  }

  Widget getAudioCard(BuildContext context, Map<String, dynamic> doc) {
    print("1 : " + indicator.toString());
    print("2 : " + length.toString());
    return Container(
      child: Row(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            child: Icon(Icons.replay_10),
            onTap: () async {
              int cur = await ap.getCurrentPosition();
              int result = await ap.seek(Duration(milliseconds: cur - 10000));
            },
          ),
          GestureDetector(
            child: Icon(Icons.forward_10),
            onTap: () async {
              int cur = await ap.getCurrentPosition();
              int result = await ap.seek(Duration(milliseconds: cur + 10000));
            },
          ),
          Expanded(
            child: Slider(
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
            ),
          ),
        ],
      ),
    );
  }
}
