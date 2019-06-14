import 'package:flutter/material.dart';

import 'customwidgets.dart';
final List wilayaList = ["Oranaise","Algeroise","Setifienne","Kabyle","Constantinoise","Tlemcenienne","Mozabite"];
final double borderRadiusValue =8.0;
final double itemWidth = 160;
final double itemHeight = 300;
class CuisineItem extends StatelessWidget {


  String imageUrl;
  String itemTitle;
  CuisineItem(imageUrl, itemTitle){
    this.imageUrl = imageUrl;
    this.itemTitle=itemTitle;
  }

  double getPaddingForImageItem(wordSize){
    if(wordSize > 10) return 12.0 ;
    else if (wordSize <= 6 ) return 30.0;
        else
          return 25.0;

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20.0),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadiusValue),
            child: Container(
              padding: EdgeInsets.all(0.0),
              width: itemWidth,
              height: itemHeight,
                child: Image.asset(
                  imageUrl,

                  fit: BoxFit.fill,
                ),
            ),
          ),
          Container(

            padding: EdgeInsets.all(0.0),
            width: itemWidth,
            height: itemHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadiusValue),
                color: Colors.black45,
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black26,
                    offset: new Offset(2.0, 1.0),
                  )
                ]
                ),
          ),
          Center(
            child: Padding(
              padding:  EdgeInsets.only(left:getPaddingForImageItem(this.itemTitle.length)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      itemTitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        fontFamily: "Heebo"
                          ),
                    ),
                  ),
                  Text("Consulter les plats >",
                      style: TextStyle(color: Colors.white,fontSize: 12.0)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CuisineWidget extends StatelessWidget {
  const CuisineWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: wilayaList.length,
      itemBuilder: (BuildContext context,int index){
        print(wilayaList[index]);
        return CuisineItem( "assets/images/image_1.jpg" ,wilayaList[index]);

      },

    );
  }
}
