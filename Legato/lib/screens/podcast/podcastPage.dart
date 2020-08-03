import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Podcast extends StatefulWidget {
  Podcast();

  @override
  _Podcast createState() => _Podcast();
}

class _Podcast extends State<Podcast> {
  _Podcast();

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
            IntrinsicHeight(
              child: ListTile(
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
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
