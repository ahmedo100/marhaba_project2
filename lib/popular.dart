import 'package:flutter/material.dart';

List hostList = [
  ["Host Timimoune", 120],
  ["Host BenDahman", 65],
  ["Selmaoui Hosting", 90]
];

class PopularItem extends StatelessWidget {
  final double itemWidth = 150.0;
  final double itemHeight = 200;

  String imageUrl;
  String hostTitle;
  int totalReviews;
  PopularItem({String hostTitle, int totalReviews}) {
    this.totalReviews = totalReviews;
    this.hostTitle = hostTitle;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Container(
        width: itemWidth,
        height: itemHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(9.0),
              child: Image.asset("assets/images/mhajeb.png"),
            ),
            Text(
              this.hostTitle,
              style: TextStyle(fontSize: 15.0,fontFamily: "Heebo"),
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.star,
                  size: 15.0,
                  color: Colors.orange,
                ),Icon(
                  Icons.star,
                  size: 15.0,
                  color: Colors.orange,
                ),Icon(
                  Icons.star,
                  size: 15.0,
                  color: Colors.orange,
                ),Icon(
                  Icons.star,
                  size: 15.0,
                  color: Colors.orange,
                ),Icon(
                  Icons.star_border,
                  size: 15.0,
                  color: Colors.orange,
                ),

                Text(
                  " Reviews ${this.totalReviews}",

                  style: TextStyle(color: Colors.grey,fontSize: 11.0),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PopularWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return PopularItem(
          hostTitle: hostList[index][0],
          totalReviews: hostList[index][1],
        );
      },
      itemCount: hostList.length,
    );
  }
}
