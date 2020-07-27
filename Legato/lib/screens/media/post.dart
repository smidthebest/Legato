import 'package:flutter/material.dart';

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
