import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
        title: Text(
          "Panier",
          style: TextStyle(color: Colors.black87),
        ),
        leading: IconButton(

            icon: Icon(
              Icons.arrow_back,
              color: Colors.black87,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CartItem(productName: "Tchekhchokha",imageUrl: "assets/images/chekhchokha.png",productPrice: 800,productQuantity: 4 ,),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CartItem(productName: "Tchekhchokha",imageUrl: "assets/images/chekhchokha.png",productPrice: 800,productQuantity: 4 ,),
          ),
          Spacer(),
          Divider(height: 2.0,),

          BottomCartWidget(),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CartItem extends StatefulWidget {
  String productName , imageUrl;
  double productPrice;
  int productQuantity;
  CartItem({this.productName, this.productPrice,this.productQuantity,this.imageUrl });

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center  ,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Divider(height: 2.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.remove_circle,
              ), onPressed: () {},
            ),
            Container(
              width: 60,
              height: 60,
              child: ClipRRect(
                child: Image.asset(
                  this.widget.imageUrl,
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.widget.productName,
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    "${this.widget.productPrice} DA ",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            ],
        ),
            Spacer(),
            Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    setState(() {
                      if(this.widget.productQuantity>0)this.widget.productQuantity--;
                    });
                  },
                  icon: Icon(
                    Icons.remove_circle,
                  ),
                ),
                Text("${this.widget.productQuantity}"),
                IconButton(
                  onPressed: () {
                    setState(() {
                      this.widget.productQuantity++;
                    });
                  },
                  icon: Icon(
                    Icons.add_circle,
                  ),
                )
          ],
        ),

        Divider(height: 2.0,),
      ],
    );
  }
}


class BottomCartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: <Widget>[

        Padding(
          padding: const EdgeInsets.only(left:20.0,right: 20),
          child: Row(
            children: <Widget>[
              Text("Total",style: TextStyle(fontSize: 16,fontFamily: "Heebo"),),
              Spacer(),
              Text("800Da")
            ],
          ),
        ),
          Padding(
            padding: const EdgeInsets.only(left:20.0,right: 20),
            child: Row(
              children: <Widget>[
                Text("Reduction",style: TextStyle(fontSize: 16,fontFamily: "Heebo"),),
                Spacer(),
                Text("0 Da")
              ],
            ),
          ),
          CupertinoButton(
            onPressed: (){},
            color: Colors.orangeAccent,
            child: Text("Acheter",style: TextStyle(color: Colors.black87),),
          )
        ],
      ),
    );
  }

}
