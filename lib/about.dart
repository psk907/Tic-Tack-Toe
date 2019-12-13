import 'package:flutter/material.dart';
class AboutPageState extends StatefulWidget {
  
  @override
  _AboutPageState createState() => _AboutPageState();
}


class _AboutPageState extends State<AboutPageState> {
  
   AssetImage logo = AssetImage("images/logo.png");



  @override
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: Center(child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
              Text("\n"),
           Image(image: logo,width: 200,height :200),
           Text("\n\nThis is a rough development of the Tic-Tac-Toe game\n\nThanks for playing.\n\n-Suraj Kumar-\n", style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,),
              Text("DM on Insta for feedback : @psk_907", style: TextStyle(fontSize: 14.0),
              textAlign: TextAlign.center,)
          ],
        ),),
        );
  }
}
