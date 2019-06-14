import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:marhaba_project/facebook_icon_icons.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 35.0,
          right: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              " Bienvenue",
              style: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Heebo"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "   Connecter pour continuer",
                style: TextStyle(fontSize: 17.0, color: Colors.grey),
              ),
            ),
            CustomForm(),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Mot de passe oublié ?",
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),
            CustomButton("Connecter"),
            CustomButton("Connecter avec Facebook"),
               Expanded(child: SizedBox(width: double.infinity,)),
              Padding(
                padding: const EdgeInsets.only(bottom:20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Vous n'avez pas de compte ?"),
                    FlatButton(
                      onPressed: ()=>{},
                      child: Text(" Inscrivez vous",style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Heebo",
                      )),
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  String labelText;
  IconData inputIcon;
  InputField(labelText, inputIcon) {
    this.labelText = labelText;
    this.inputIcon = inputIcon;
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: inputIcon == Icons.lock,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          suffixIcon: Icon(
            inputIcon,
            color: Colors.orangeAccent,
          )),
    );
  }
}

class CustomForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputField("Email", Icons.email),
          InputField("Mot de Passe", Icons.lock),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  Color backgroundColor;
  Color textColor;
  String buttonText;
  CustomButton(this.buttonText) {
    if (this.buttonText == "Connecter") {
      this.textColor = Colors.black87;
      this.backgroundColor = Colors.orangeAccent;
    } else {
      this.textColor = Colors.white70;
      this.backgroundColor = Colors.black;
    }
  }
  @override
  Widget build(BuildContext context) {
    print(this.buttonText);
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
          width: double.infinity,
          child: CupertinoButton(
            pressedOpacity: 0.6,
            onPressed: () => {Navigator.pushNamed(context, '/mainPage')},
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              if (this.buttonText != "Connecter")
                Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(FacebookIcon.facebook_circled)),
              Text(
                this.buttonText,
                style: TextStyle(color: this.textColor, fontFamily: "Heebo"),
              )
            ]),
            color: this.backgroundColor,
          )),
    );
  }
}
