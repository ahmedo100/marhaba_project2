import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:marhaba_project/customwidgets.dart';
List notificationList = [["Votre repas est pret ","Le plat <Couscous ... > peut etre récupérer\n à Sidi Yahiya Villa N°5  ",23],["Votre repas est pret ","Le plat <Couscous ... > peut etre récupérer\n à Sidi Yahiya Villa N°5  ",23],["Votre repas est pret ","Le plat <Couscous ... > peut etre récupérer\n à Sidi Yahiya Villa N°5  ",23],["Votre repas est pret ","Le plat <Couscous ... > peut etre récupérer\n à Sidi Yahiya Villa N°5  ",23],["Votre repas est pret ","Le plat <Couscous ... > peut etre récupérer\n à Sidi Yahiya Villa N°5  ",23]];
class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black87,), onPressed: (){Navigator.pop(context);}),
        title:Text(
          "Notifications",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Heebo",
              color: Colors.black,
              fontSize: 25.0),
        ) ,
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: ()=>{},
            icon: Icon(Icons.search,color: Colors.black87,),
          )
        ],
      ),
      body: new NotificationPageBody(),
      bottomNavigationBar: CustomBottomNavBar(0),
    );
  }
}

class NotificationPageBody extends StatelessWidget {
  const NotificationPageBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return NotificationItem(maintitle:notificationList[index][0],content:notificationList[index][1],timer:notificationList[index][2]);
              },
              itemCount: notificationList.length,
            ),
          )
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  String mainTitle ; // This is the main title used in the notification

  String content ; // This is the content displayed in the body of the notification

  int timer ; // This is the time displayed in the notification

  String imageUrl ; // This is the image displayed in the notification

  NotificationItem({String maintitle,String content , int timer}){
    this.mainTitle = maintitle;

    this.content = content ;

    this.timer = timer;

  }
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      child: InkWell(
        onTap: ()=>{},
        onLongPress: ()=>{},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Container(
                  width: 120,
                  child: ClipRRect(
                    child: Image.asset("assets/images/chekhchokha.png"),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(left:20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text(this.mainTitle,style: TextStyle(fontSize: 13.0,fontFamily: 'Heebo',fontWeight: FontWeight.bold),maxLines: 3,),
                    Text(this.content,style: TextStyle(fontSize: 12.0),),
                    Text("${this.timer} minutes",style: TextStyle(color: Colors.grey),)
                  ],
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
