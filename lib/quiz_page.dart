import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> listaScore = [];
  int questionNumber = 0;
  List<Question> questionBank = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(
        q: 'A slug\'s blood is green.',
        a: true) //Colocamos o \' para mostra como String o '.
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[questionNumber]
                    .questionText, //Para coletar o index "questionNumber" em questionText
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  bool correctAnswer = questionBank[questionNumber]
                      .questionAnswer; //Para coletar o index "questionNumber" em questionAnswer
                  if (correctAnswer == true) {
                    print("Você acertou");
                    listaScore.add(Icon(Icons.check, color: Colors.green));
                  } else {
                    print("Você errou");
                    listaScore.add(Icon(Icons.close, color: Colors.red));
                  }

                  questionNumber++;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  bool correctAnswer = questionBank[questionNumber]
                      .questionAnswer; //Para coletar o index "questionNumber" em questionAnswer
                  if (correctAnswer == false) {
                    print("Você acertou");
                    listaScore.add(Icon(Icons.check, color: Colors.green));
                  } else {
                    print("Você errou");
                    listaScore.add(Icon(Icons.close, color: Colors.red));
                  }

                  questionNumber++;
                });
              },
            ),
          ),
        ),
        Row(
          children: listaScore,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
