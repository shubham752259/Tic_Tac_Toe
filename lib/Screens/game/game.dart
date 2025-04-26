import 'package:flutter/material.dart';

class Gamescreen extends StatefulWidget {
  @override
  State<Gamescreen> createState() => _GamescreenState();
}

class _GamescreenState extends State<Gamescreen> {
  bool oTurn = true;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];

  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  String resultDeclartion = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF09A5A),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Player X',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            xScore.toString(),
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Player O',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            oScore.toString(),
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index); // handle tap
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 5, color: Color(0XFF000000)),
                        color: Color(0XFFFFFFFF),
                      ),
                      child: Center(
                        child: Text(
                          displayXO[index],
                          style: TextStyle(
                            fontSize: 64,
                            color: Color(0XFFFE1515),
                            fontFamily: 'bold',
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    resultDeclartion,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _playAgain,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    child: Text('Play Again'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (displayXO[index] == '') {
        if (oTurn) {
          displayXO[index] = 'O';
        } else {
          displayXO[index] = 'X';
        }
        oTurn = !oTurn;
        filledBoxes += 1;
        _checkWinner();
      }
    });
  }

  void _checkWinner() {
    // Check 1st row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclartion = 'Player ' + displayXO[0] + ' Wins';
        _updateScore(displayXO[0]);
      });
    }

    // Check 2nd row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        resultDeclartion = 'Player ' + displayXO[3] + ' Wins';
        _updateScore(displayXO[3]);
      });
    }

    // Check 3rd row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        resultDeclartion = 'Player ' + displayXO[6] + ' Wins';
        _updateScore(displayXO[6]);
      });
    }

    // Check 1st column
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclartion = 'Player ' + displayXO[0] + ' Wins';
        _updateScore(displayXO[0]);
      });
    }

    // Check 2nd column
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        resultDeclartion = 'Player ' + displayXO[1] + ' Wins';
        _updateScore(displayXO[1]);
      });
    }

    // Check 3rd column
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclartion = 'Player ' + displayXO[2] + ' Wins';
        _updateScore(displayXO[2]);
      });
    }

    // Check diagonal from top-left to bottom-right
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclartion = 'Player ' + displayXO[0] + ' Wins';
        _updateScore(displayXO[0]);
      });
    }

    // Check diagonal from top-right to bottom-left
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclartion = 'Player ' + displayXO[2] + ' Wins';
        _updateScore(displayXO[2]);
      });
    }

    // Check for Draw
    if (filledBoxes == 9 && resultDeclartion == '') {
      setState(() {
        resultDeclartion = 'It\'s a Draw!';
      });
    }
  }

  void _updateScore(String winner) {
    if (winner == 'X') {
      xScore += 1;
    } else if (winner == 'O') {
      oScore += 1;
    }
  }

  void _playAgain() {
    setState(() {
      displayXO = ['', '', '', '', '', '', '', '', ''];
      resultDeclartion = '';
      filledBoxes = 0;
      oTurn = true;
    });
  }
}
