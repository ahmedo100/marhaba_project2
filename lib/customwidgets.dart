import 'package:flutter/material.dart';

class MenuHeader extends StatelessWidget {
  String menuTitle;
   MenuHeader( {String menuTitle}) {
    this.menuTitle = menuTitle;
    print("${this.menuTitle} inside menu header");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          Text(
              this.menuTitle,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              fontFamily: "Heebo")),
      GestureDetector(
          onTap: () => {},
      child: Row(
        children: <Widget>[
          Text(
            "Voir tout",
            style: TextStyle(color: Colors.grey[500]),
          ),
          Icon(Icons.keyboard_arrow_right)
        ],
      ),
    ),

    ],
    ),
    );
  }
}
class MenuWidget extends StatelessWidget {
  double heightValue;
  Widget childWidget;
  String menuTitle;
  MenuWidget({
    Key key , Widget childWidget,double heightValue,String menuTitle}
      ) : super(key: key) {
    this.heightValue = heightValue;
    this.childWidget = childWidget;
    this.menuTitle = menuTitle;
    print("${this.menuTitle} inside menu widget");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new MenuHeader(menuTitle:this.menuTitle),
        Container(
          width: double.infinity,
          height: this.heightValue,
          child: childWidget,
        ),

      ],

    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  int currentIndex;
   CustomBottomNavBar(int currentindex){
     this.currentIndex = currentindex;
   }

  BottomNavigationBarItem BTBItems(itemIcon, itemTitle) {
    return BottomNavigationBarItem(
backgroundColor: Colors.orangeAccent,
      icon: Icon(
        itemIcon,
        size: 25.0,
      ),
      title: Text(
        itemTitle,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index)=>{
        if (index == 0 )Navigator.pushNamed(context, '/mainPage')
      },
      currentIndex: this.currentIndex,
        backgroundColor: Colors.orangeAccent,
        type: BottomNavigationBarType.fixed,
        elevation: 0.0,
        selectedItemColor: Colors.black87,
        items: [
          BTBItems(Icons.search, "Acceuil"),
          BTBItems(Icons.message, "Messages"),
          BTBItems(Icons.local_dining, "Mes repas"),
          BTBItems(Icons.person, "Profile"),
        ]);
  }
}