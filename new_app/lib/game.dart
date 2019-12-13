import 'package:flutter/material.dart';
class GamePageState extends StatefulWidget {
  
  @override
  _GamePageState createState() => _GamePageState();
}


class _GamePageState extends State<GamePageState> {
  
  List<String> boxValue;
  bool isX = true;
  String message;
  List<String> winPattern;
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  

  @override
  void initState() {
    //Constructor method
    super.initState();
    setState(() {
      //this is where we initialize the values
      this.boxValue = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ]; //initialized the values of all the boxes to empty
      this.message = "";
    });
  }

  resetGame() {
    
    setState(() {
      this.boxValue = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
       this.message = "";
    });
  }

  AssetImage getImage(String value) {
    switch (value) {
      case ('O'):
        return circle;
        break;
      case ('X'):
        return cross;
        break;
      default:
        return edit;
    }
  }
  //Delay Effect
  Delay(){
    Future.delayed(const Duration(milliseconds: 1600),(){
      setState(() {
        this.resetGame();
      });
    });
  }

  checkWin() {
    if ((boxValue[0] != 'empty') &&
        (boxValue[0] == boxValue[1]) &&
        (boxValue[1] == boxValue[2])) {
      // if any user Win update the message state
      setState(() {
        this.message = '${this.boxValue[0]} wins';
        this.Delay();
      });
    } else if ((boxValue[3] != 'empty') &&
        (boxValue[3] == boxValue[4]) &&
        (boxValue[4] == boxValue[5])) {
      setState(() {
        this.message = '${this.boxValue[3]} wins';
        this.Delay();
      });
    } else if ((boxValue[6] != 'empty') &&
        (boxValue[6] == boxValue[7]) &&
        (boxValue[7] == boxValue[8])) {
      setState(() {
        this.message = '${this.boxValue[6]} wins';
        this.Delay();
      });
    } else if ((boxValue[0] != 'empty') &&
        (boxValue[0] == boxValue[3]) &&
        (boxValue[3] == boxValue[6])) {
      setState(() {
        this.message = '${this.boxValue[0]} wins';
        this.Delay();
      });
    } else if ((boxValue[1] != 'empty') &&
        (boxValue[1] == boxValue[4]) &&
        (boxValue[4] == boxValue[7])) {
      setState(() {
        this.message = '${this.boxValue[1]} wins';
        this.Delay();
      });
    } else if ((boxValue[2] != 'empty') &&
        (boxValue[2] == boxValue[5]) &&
        (boxValue[5] == boxValue[8])) {
      setState(() {
        this.message = '${this.boxValue[2]} wins';
        this.Delay();
      });
    } else if ((boxValue[0] != 'empty') &&
        (boxValue[0] == boxValue[4]) &&
        (boxValue[4] == boxValue[8])) {
      setState(() {
        this.message = '${this.boxValue[0]} wins';
        this.Delay();
      });
    } else if ((boxValue[2] != 'empty') &&
        (boxValue[2] == boxValue[4]) &&
        (boxValue[4] == boxValue[6])) {
      setState(() {
        this.message = '${this.boxValue[2]} wins';
        this.Delay();
      });
    } else if (!boxValue.contains('empty')) {
      setState(() {
        this.message = 'Game Draw';
        this.Delay();
      });
    }
  }

  playGame(int index) {
    if (this.boxValue[index] == "empty") {
      //if the box is unplayed
      if (this.isX) {
        setState(() {
          this.boxValue[index] = "X"; //mark an X in the array
        });
      } else {
        setState(() {
          this.boxValue[index] = "O"; //mark an O in the array
        });
      }
      isX = !isX; //flipping the control to the other player
      //Now check if the player has won
      checkWin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            

             Expanded(
              
              child: GridView.builder(
                itemBuilder: (context, i) => SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: MaterialButton(
                    onPressed: () {
                      this.playGame(i);
                    },
                    child: Image(
                      image: this.getImage(this.boxValue[i]),
                    ),
                    
                  ),
                ),
                padding: EdgeInsets.all(20.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0),
                itemCount: this.boxValue.length,
              ),
            ),
            Text(
              "$message", 
              style: TextStyle(fontSize: 40.0),
              textAlign: TextAlign.center,
            ),
            //MaterialButton(child: Text("Reset"),onPressed: this.resetGame(),),
          ],
        ),
        );
  }
}
