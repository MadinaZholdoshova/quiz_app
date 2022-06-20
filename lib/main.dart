import 'package:flutter/material.dart';
import 'question_class.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  QuestionBank questionBank = QuestionBank();

  int questionIndex = 0;

  bool correctAnswer;

  void UpdateQuestion(bool userChoice) {
    if (userChoice == correctAnswer) {
      setState(() {
        scoreIcon.add(
          Icon(
            Icons.check,
            size: 50.0,
            color: Colors.green,
          ),
        );
        questionIndex++;
        score++;
        lastQuestion();
      });
    } else {
      setState(() {
        scoreIcon.add(
          Icon(
            Icons.close,
            size: 50.0,
            color: Colors.red,
          ),
        );
        questionIndex++;
        lastQuestion();
      });
    }
  }

  void lastQuestion() {
    if (questionIndex == questionBank.questionBrain.length) {
      setState(() {
        questionIndex = 0;
        scoreIcon = [];
      });
    }
  }

  int score = 0;


  List<Icon> scoreIcon = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: Container(
          child: Padding(
            padding: const EdgeInsets. only(top: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      questionBank.questionBrain[questionIndex].questionText,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 50.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                ),
                Container(
                  //height: MediaQuery.of(context).size.height * 0.2,
                  width: 15,
                  color: Colors.green,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: () {
                      correctAnswer = questionBank
                        .questionBrain[questionIndex].QuestionAnswer;
                      UpdateQuestion(true);
                    },
                    child: Text(
                      'true',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                  width: 40.0,
                ),
                Container(
                  width: 15.0,
                  color: Colors.red,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () {
                      correctAnswer = questionBank
                          .questionBrain[questionIndex].QuestionAnswer;
                      UpdateQuestion(false);
                    },
                    child: Text(
                      'false',
                      style: TextStyle(color: Colors.white, fontSize: 40.0),
                    ),
                  ),
                ),
                Row(
                  children: scoreIcon,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

