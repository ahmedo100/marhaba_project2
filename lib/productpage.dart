import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

List extraItems = ["Pain Maison"];
class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  double _totalPrice  = 800;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Marhaba",style: TextStyle(color: Colors.black87),),
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        leading: IconButton(
          onPressed: ()=>{
            Navigator.pop(context)
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.favorite_border,
              color: Colors.black87,
            ),
          )
        ],
      ),

      body: ListView(
        children: <Widget>[
          new ImageWidget(),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Tchekhchokha Constantinoise ",
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Heebo"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: <Widget>[
                        Text("\$800DA ",style: TextStyle(fontSize: 14),),
                        Text(
                          "200g",
                          style: TextStyle(color: Colors.grey,fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                        '''Lorem ipsum dolor sit amet, sed recusabo abhorreant necessitatibus an. An sea rebum patrioque. Lucilius  persequeris duo id'''),
                  ),
                  Divider(),

                  Text("Ingredients",style: titleStyle()),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text('''Lorem ipsum dolor sit amet, sed recusabo abhorreant necessitatibus an. An sea rebum patrioque'''),
                  ),

                  Divider(),

                  Text("Nos Extras",style: titleStyle()),

                  new ExtraWidget(titleName:"Pain Maison",priceTag: 100,),
                  new ExtraWidget(titleName:"Boisson",priceTag: 80,),
                  new ExtraWidget(titleName:"Dessert Traditionnel",priceTag: 200,),
                  new ExtraWidget(titleName:"Morçeau Poulet",priceTag: 100,),

                  Divider(),

                  Text("Quantité",style: titleStyle()),

                  QuantityWidget(),

                  Divider(),

                  Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: Center(
                      child: CupertinoButton(child: Text("Ajouter au panier",style: TextStyle(color: Colors.black87),), onPressed: (){},color: Colors.orangeAccent,),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          "assets/images/chekhchokha.png",
        ),
        fit: BoxFit.cover,
      )),
    );
  }
}

class ExtraWidget extends StatefulWidget {
  final String titleName ;
  final int priceTag;
  bool checked = false;
   ExtraWidget ({this.titleName,this.priceTag});
  @override
  _ExtraWidgetState createState() => _ExtraWidgetState();
}

class _ExtraWidgetState extends State<ExtraWidget> {



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: (){
            setState(() {
              this.widget.checked = !this.widget.checked;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("${this.widget.titleName}  ",),
                  Text("${this.widget.priceTag}DA",style: TextStyle(color: Colors.grey),)
                ],

              ),
    Opacity(opacity: getCurrentCheck(this.widget.checked) ,child: IconButton(icon:Icon(Icons.check,color: Colors.black,)))

            ],
          ),
        ),
      ],
    );
  }
}


double getCurrentCheck(check){

  print(check);

  return check ? 1.0 : 0.0;

}

TextStyle titleStyle(){
  return TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,fontFamily: "Heebo");
}

class QuantityWidget extends StatefulWidget {
  int numberOfItems = 0;
  @override
  _QuantityWidgetState createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("${this.widget.numberOfItems} Repas "),
        Container(
          padding: EdgeInsets.only(right: 10.0),
          child: Row(
            children: <Widget>[
              ButtonTheme(minWidth:10.0,child: OutlineButton(onPressed: ()=>{
                setState((){
                  this.widget.numberOfItems++;
    })
              },child: Icon(Icons.add),)),
              ButtonTheme(minWidth:10.0,child: OutlineButton(onPressed: ()=>{
                setState((){
                  if( this.widget.numberOfItems> 0 ) this.widget.numberOfItems--;
    })
    },child: Icon(Icons.remove),)),
            ],
          ),
        )
      ],
    );
  }
}