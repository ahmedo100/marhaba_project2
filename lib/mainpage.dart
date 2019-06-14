import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:marhaba_project/ios_search_bar.dart';
import 'package:marhaba_project/cuisineitem.dart';
import 'package:marhaba_project/popular.dart';
import 'package:marhaba_project/tendances.dart';

import 'customwidgets.dart';
final List wilayaList = ["Oranaise","Algeroise","Setifienne","Kabyle","Constantinoise","Tlemcenienne","Mozabite"];
class SearchPage extends StatefulWidget {
  SearchPage();

  createState() => new SearchPageState();
}

class SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  SearchPageState();

  TextEditingController _searchTextController = new TextEditingController();
  FocusNode _searchFocusNode = new FocusNode();
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = new AnimationController(
      duration: new Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = new CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    );
    _searchFocusNode.addListener(() {
      if (!_animationController.isAnimating) {
        _animationController.forward();
      }
    });
  }

  void _cancelSearch() {
    _searchTextController.clear();
    _searchFocusNode.unfocus();
    _animationController.reverse();
  }

  void _clearSearch() {
    _searchTextController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(
            icon: Icon(Icons.shopping_cart), color: Colors.black87, onPressed: () => {
              Navigator.pushNamed(context,"/cartPage")
        }),
        title: Text(
          "Marhaba",
          style: TextStyle(color: Colors.black87),
        ),
        actions: <Widget>[

          new NotificationWidget()
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: new IOSSearchBar(
              controller: _searchTextController,
              focusNode: _searchFocusNode,
              animation: _animation,
              onCancel: _cancelSearch,
              onClear: _clearSearch,
            ),
          ),
          Divider(),
          new MenuWidget(childWidget: CuisineWidget(),heightValue: 120.0,menuTitle:"Cuisines"),
          new MenuWidget(childWidget: TendanceWidget(),heightValue: 200.0,menuTitle: "Tendances cette semaine",),
          new MenuWidget(childWidget: PopularWidget(),heightValue: 300,menuTitle: "Hotes populaires",)
        ],
      ),
      bottomNavigationBar: new CustomBottomNavBar(0),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () => {
            Navigator.pushNamed(context, '/notificationPage')
          },
          color: Colors.black87,
        ),
        Positioned(
          left: 27,
          top: 10,
          child: Icon(Icons.brightness_1
          ,color: Colors.redAccent,
            size: 9.0  ,
          ),
        )
      ],
    );
  }
}





