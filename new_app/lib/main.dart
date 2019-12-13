import 'package:flutter/material.dart';
import './game.dart';
import './about.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _cIndex = 0;
  


  @override
  




  
  final _pageOptions = [
       GamePageState(),
       AboutPageState(),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TicTacToe"),
          
        ),
        body:_pageOptions[_cIndex],
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.red,
          currentIndex: _cIndex,
          type: BottomNavigationBarType.fixed,
          
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_filled), title: new Text('Play')),
            BottomNavigationBarItem(
                icon: Icon(Icons.info), title: new Text('About'))
          ],
          onTap: (index) {
           setState(() {
                    _cIndex = index;
                });
          },
        ));
  }
}
