import 'package:flutter/material.dart';
import 'quiz_bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


QuizBank quizBank = new QuizBank();

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: Text(
            'Quiz App',
            style: TextStyle(fontSize: 30)
            ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  final List<Widget> scoreKeeper = [];

  int totalCorrect = 0;
  int totalQuestions = 0;

  void checkAnswer(bool userPicked) {
    bool correctAnswer =  quizBank.getAnswer();

    setState(() {
    

    totalQuestions++;

    if (correctAnswer == userPicked) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green,));
        totalCorrect++;
        print('correct');
    } else {
      scoreKeeper.add(Icon(Icons.close, color: Colors.red,));
    } 
    if (quizBank.isFinished() == true) {
      Alert(
        context: context, 
        title: 'Finished',
        desc: 'You scored a total of $totalCorrect out of $totalQuestions!',
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Play Again',
              style: TextStyle(color: Colors.white, fontSize: 22),
              ),
          )
        ]
        ).show();
      quizBank.reset();
      scoreKeeper.clear();
      totalCorrect = 0;
      totalQuestions = 0;
    } else {
      quizBank.nextQuestion();
    }
  });
}
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: SizedBox(

          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.blue[200],
              ),
              child: Center(
                child: Text(
                  quizBank.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 33.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),
                textColor: Colors.white,
                color: Colors.greenAccent[700],
                child: Text(
                  'TRUE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  checkAnswer(true);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),
                textColor: Colors.white,
                color: Colors.redAccent[400],
                child: Text(
                  'FALSE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  checkAnswer(false);
                },
              ),
            ),
          )]),
        ),
        Expanded(child: Row(children: scoreKeeper,)),
    ]);
  }
}
