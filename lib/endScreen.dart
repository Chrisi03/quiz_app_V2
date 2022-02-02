import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class EndScreen extends StatefulWidget {
  final rightAnswers;
  final numberQuestions;

  const EndScreen(this.rightAnswers,this.numberQuestions, {Key? key}) : super(key: key);

  @override
  State<EndScreen> createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("End Screen"),
        ),
        body: Column(
          children: [
            Container(
              child: SizedBox(
                height: 200,
                width: 200,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: 1 / widget.numberQuestions * widget.rightAnswers,
                      strokeWidth: 10.0,
                      backgroundColor: Colors.lightBlue,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                    ),
                    Center(
                      child: Text(
                        widget.rightAnswers.toString() + '/' + widget.numberQuestions.toString(),
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
              child: Text("Restart"),
            ),
          ],
        ));
  }
}
