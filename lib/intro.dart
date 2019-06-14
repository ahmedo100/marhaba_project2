import "package:flutter/material.dart";


class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Image.asset("assets/images/third.jpg"
            ,fit: BoxFit.fitHeight,
              filterQuality: FilterQuality.high,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:50.0,left:25),
                child: Text("Lorem ipsum dolor \nsit  ",style: TextStyle(
                  fontSize: 40.0,fontFamily: "Heebo",fontWeight: FontWeight.bold,color: Colors.yellowAccent
                ),),
              )
            ],
          )
        ],
      ),
    );

  }

}

