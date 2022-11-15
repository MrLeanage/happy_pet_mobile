class ObservationQuestion{
  String _observationName = '';
  String _observationQuestion = '';
  String _observationAnswer = '';

  ObservationQuestion();

  ObservationQuestion.initAll(this._observationName, this._observationQuestion,
      this._observationAnswer);

  ObservationQuestion.fromJson(var json){
    this._observationName = json['observation'];
    this._observationQuestion = json['question'];
    this._observationAnswer = json['answer'];
  }

  // ignore: unnecessary_getters_setters
  String get observationAnswer => _observationAnswer;

  // ignore: unnecessary_getters_setters
  set observationAnswer(String value) {
    _observationAnswer = value;
  }

  // ignore: unnecessary_getters_setters
  String get observationQuestion => _observationQuestion;

  // ignore: unnecessary_getters_setters
  set observationQuestion(String value) {
    _observationQuestion = value;
  }

  // ignore: unnecessary_getters_setters
  String get observationName => _observationName;

  // ignore: unnecessary_getters_setters
  set observationName(String value) {
    _observationName = value;
  }
}