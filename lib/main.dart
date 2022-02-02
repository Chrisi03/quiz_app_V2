import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Question.dart';
import 'endScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Quiz(),
      title: 'quiz',
    );
  }
}

class Quiz extends StatefulWidget {
  Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final questions = [
    Question('2+2=?', ['2', '4', '5', '3'], 1),
    Question('Wer ist kein Fußballe', ['Ronaldo', 'Messi', 'Nadal'], 2),
    Question('Sind Pos Tests einfach?', ['Ja','Nein','Vielleicht','unmöglich'],2)
  ];
  var questionIndex = 0;
  var rightAnswers = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: // QuizItem(questions[0]),
          Container(
        padding: EdgeInsets.all(2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  questions[questionIndex].quest,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                )),
            Expanded(
              child: SizedBox(
                height: 200.0,
                child: ListView.builder(
                  itemCount: questions[questionIndex].answers.length,
                  itemBuilder: (_, index) => ElevatedButton(
                      onPressed: () {
                        if (index == questions[questionIndex].rightAnswer) {
                          rightAnswers++;
                        }
                        if (questionIndex < questions.length - 1) {
                          setState(() {
                            questionIndex++;
                          });
                        } else {
                          Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => EndScreen(rightAnswers,questions.length),
                            ),
                          );
                        }
                      },
                      child: Text(questions[questionIndex].answers[index])),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
