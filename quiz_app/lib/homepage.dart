import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Quizbrain quizbrain = Quizbrain();
  int rightAnswer = 0;
  int wrongAnswer = 0;
  int total_score = 13;

  List<Icon> ScoreKeeper = [];

  void isCorrectAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizbrain.getQuestionAnswer();

    setState(() {
      if (quizbrain.isFinished() == true) {
        if (rightAnswer > wrongAnswer) {
          // Alert(
          //   context: context,
          //   title: 'Congratulations! You WON 😍',
          //   desc: 'You got $rightAnswer out of $total_score',
          // ).show();
          Alert(
            context: context,
            type: AlertType.success,
            title: "CONGRATULATIONS! You WON 😍",
            desc: "You got $rightAnswer out of $total_score",
            buttons: [
              DialogButton(
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
        } else {
          // Alert(
          //   context: context,
          //   title: 'You LOSS 😣😥',
          //   desc: 'You got $wrongAnswer out of $total_score',
          // ).show();
          Alert(
            context: context,
            type: AlertType.error,
            title: "You LOSS 😥",
            desc: "You got $wrongAnswer out of $total_score",
            buttons: [
              DialogButton(
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
        }
        quizbrain.reset();
        ScoreKeeper = [];
      } else if (userPickedAnswer == correctAnswer) {
        rightAnswer++;
        ScoreKeeper.add(Icon(Icons.check, color: Colors.green[900]));
      } else {
        wrongAnswer++;
        ScoreKeeper.add(Icon(Icons.close, color: Colors.red[900]));
      }
      quizbrain.getNextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(quizbrain.getQuestionNumber(),
                    style: GoogleFonts.lobster(
                        textStyle: TextStyle(
                      color: Color(0xff002fd3),
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ))),
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  quizbrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    color: Color(0xff454444),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  )),
                ),
              )),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {
                    isCorrectAnswer(true);
                  },
                  child: Container(
                    width: 321,
                    height: 30,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green[800],
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x3334b439),
                            offset: Offset(0, 4),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'True',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                )),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {
                    isCorrectAnswer(false);
                  },
                  child: Container(
                    width: 321,
                    height: 30,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [Color(0xffe44339)],
                        stops: [0.858818531036377],
                        begin: Alignment(-0.98, -0.19),
                        end: Alignment(0.98, 0.19),
                        // angle: 101,
                        // scale: undefined,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x3334b439),
                            offset: Offset(0, 4),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'False',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: ScoreKeeper,
              ),
            ),
          )
        ],
      )),
    );
  }
}
