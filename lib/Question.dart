class Question {
  String quest;
  List<String> answers;
  int rightAnswer;

  Question(this.quest, this.answers, this.rightAnswer);

  @override
  String toString() {
    return 'Question{quest: $quest, answers: $answers, rightAnswer: $rightAnswer}';
  }
}
