class HabitualQuestion{
  String _habitualName = '';
  String _habitualQuestion = '';
  String _habitualAnswer = '';

  HabitualQuestion();

  HabitualQuestion.initAll(this._habitualName, this._habitualQuestion,
      this._habitualAnswer);

  HabitualQuestion.fromJson(var json){
    this._habitualName = json['habit'];
    this._habitualQuestion = json['question'];
    this._habitualAnswer = json['answer'];
  }

  // ignore: unnecessary_getters_setters
  String get habitualAnswer => _habitualAnswer;

  // ignore: unnecessary_getters_setters
  set habitualAnswer(String value) {
    _habitualAnswer = value;
  }

  // ignore: unnecessary_getters_setters
  String get habitualQuestion => _habitualQuestion;

  // ignore: unnecessary_getters_setters
  set habitualQuestion(String value) {
    _habitualQuestion = value;
  }

  // ignore: unnecessary_getters_setters
  String get habitualName => _habitualName;

  // ignore: unnecessary_getters_setters
  set habitualName(String value) {
    _habitualName = value;
  }
}