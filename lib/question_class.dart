class QuestionClass {
  final String questionText;
  final bool QuestionAnswer;
  QuestionClass({this.questionText, this.QuestionAnswer});
}

class QuestionBank {
  List<QuestionClass> questionBrain = [
    QuestionClass(questionText: '1', QuestionAnswer: true),
    QuestionClass(questionText: '2', QuestionAnswer: false),
    QuestionClass(questionText: '3', QuestionAnswer: false),
    QuestionClass(questionText: '4', QuestionAnswer: true),
    QuestionClass(questionText: '5', QuestionAnswer: false),
    QuestionClass(questionText: '6', QuestionAnswer: true),
    QuestionClass(questionText: '7', QuestionAnswer: true),
  ];
}
