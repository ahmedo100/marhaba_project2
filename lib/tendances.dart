import 'package:flutter/material.dart';
final List foodNameList  = [["Kebab Poulet ","Bab El oued","assets/images/image_1.jpg"],["Couscous","Tipaza","assets/images/trida.png"],["Tchekhchokha","Boumerdes","assets/images/chekhchokha.png"]];
class TendanceItem extends StatelessWidget{
  final double itemWidth =160.0;
  final double itemHeight =300;
  String primaryTitle ;
  String secondaryTitle;
  String imageUrl ="";
  TendanceItem({String primaryTitle,String secondaryTitle,String imageUrl}){
    this.primaryTitle=primaryTitle;
    this.secondaryTitle=secondaryTitle;
    this.imageUrl = imageUrl;
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      width: itemWidth,
      height: itemHeight,
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, "/productDescription");
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(this.imageUrl,fit: BoxFit.fill,),
                ),

              ),
            ),
            Text(primaryTitle,style: TextStyle(fontSize: 18.0,fontFamily: "Heebo"),),
            Text(secondaryTitle,style: TextStyle(
            color: Colors.grey,

            ),)
          ],
        ),
      ),
    );
  }

  }

  class TendanceWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context , int index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: TendanceItem(primaryTitle: foodNameList[index][0],secondaryTitle: foodNameList[index][1],imageUrl:foodNameList[index][2]),
          ) ;
        },
    itemCount:foodNameList.length ,
    );
  }

  }