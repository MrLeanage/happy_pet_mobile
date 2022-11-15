class Remedy{
  String _id = '';
  String _diseaseName = "";
  String _remedyTitle = "";
  String _remedyBrief = "";
  List<String> _remedySteps = [];
  bool _remedyExist = false;
  String _matchedIntroID = '';
  String _matchedStepsID = '';
  double _sequenceParValue = 0.0;
  double _matchedIntroSequenceRate = 0.0;
  double _matchedStepsSequenceRate = 0.0;
  String _analyseMessage = '';

  Remedy();

  Remedy.defaultInit(this._diseaseName, this._remedyTitle, this._remedyBrief, this._remedySteps);

  Remedy.initAll(this._id, this._diseaseName, this._remedyTitle, this._remedyBrief, this._remedySteps, this._remedyExist,
      this._matchedIntroID, this._matchedStepsID, this._sequenceParValue, this._matchedIntroSequenceRate,
      this._matchedStepsSequenceRate, this._analyseMessage );

  Remedy.fromAvailabilityJson(var json){
    _diseaseName = json['report']['disease-name'];
    _remedyTitle = json['report']['new-remedy-title'];
    _remedyBrief = json['report']['new-remedy-intro'];
    _remedySteps = [json['report']['new-remedy-steps']];

    //currently server returning true if the new record not existing
    if((json['report']['new-remedy-exist']).toString().toLowerCase() == 'true'){
      _remedyExist = false;
    }else{
      _remedyExist = true;
    }

    _matchedIntroID = json['report']['matched-intro-id'];
    _matchedStepsID = json['report']['matched-steps-id'];
    _sequenceParValue = double.parse(json['report']['sequence-par-value']);

    _matchedIntroSequenceRate = double.parse(json['report']['matched-intro-sequence']);
    _matchedStepsSequenceRate = double.parse(json['report']['matched-steps-sequence']);
    _analyseMessage = json['report']['analyze-message'];
  }

  Remedy.fromRetrainJson(var json){
    _diseaseName = json['report']['disease-name'];
    _remedyTitle = json['report']['new-remedy-title'];
    _remedyBrief = json['report']['new-remedy-intro'];
    _remedySteps = [json['report']['new-remedy-steps']];

    _analyseMessage = json['report']['message'];
  }


  // ignore: unnecessary_getters_setters
  String get id => _id;

  // ignore: unnecessary_getters_setters
  set id(String value) {
    _id = value;

  }


  // ignore: unnecessary_getters_setters
  List<String> get remedySteps => _remedySteps;

  // ignore: unnecessary_getters_setters
  set remedySteps(List<String> value) {
    _remedySteps = value;
  }

  // ignore: unnecessary_getters_setters
  String get remedyBrief => _remedyBrief;

  // ignore: unnecessary_getters_setters
  set remedyBrief(String value) {
    _remedyBrief = value;
  }

  // ignore: unnecessary_getters_setters
  String get remedyTitle => _remedyTitle;

  // ignore: unnecessary_getters_setters
  set remedyTitle(String value) {
    _remedyTitle = value;
  }

  // ignore: unnecessary_getters_setters
  String get diseaseName => _diseaseName;

  // ignore: unnecessary_getters_setters
  set diseaseName(String value) {
    _diseaseName = value;
  }

  // ignore: unnecessary_getters_setters
  String get analyseMessage => _analyseMessage;

  // ignore: unnecessary_getters_setters
  set analyseMessage(String value) {
    _analyseMessage = value;
  }

  // ignore: unnecessary_getters_setters
  double get matchedStepsSequenceRate => _matchedStepsSequenceRate;

  // ignore: unnecessary_getters_setters
  set matchedStepsSequenceRate(double value) {
    _matchedStepsSequenceRate = value;
  }

  // ignore: unnecessary_getters_setters
  double get matchedIntroSequenceRate => _matchedIntroSequenceRate;

  // ignore: unnecessary_getters_setters
  set matchedIntroSequenceRate(double value) {
    _matchedIntroSequenceRate = value;
  }

  // ignore: unnecessary_getters_setters
  double get sequenceParValue => _sequenceParValue;

  // ignore: unnecessary_getters_setters
  set sequenceParValue(double value) {
    _sequenceParValue = value;
  }

  // ignore: unnecessary_getters_setters
  String get matchedStepsID => _matchedStepsID;

  // ignore: unnecessary_getters_setters
  set matchedStepsID(String value) {
    _matchedStepsID = value;
  }

  // ignore: unnecessary_getters_setters
  String get matchedIntroID => _matchedIntroID;

  // ignore: unnecessary_getters_setters
  set matchedIntroID(String value) {
    _matchedIntroID = value;
  }

  // ignore: unnecessary_getters_setters
  bool get remedyExist => _remedyExist;

  // ignore: unnecessary_getters_setters
  set remedyExist(bool value) {
    _remedyExist = value;
  }
}