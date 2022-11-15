import 'package:happy_pet/model/remedy.dart';

class RemedyAnalysis{
  late Remedy _remedyData;
  String _analyseMessage = "";
  bool _remedyExistence = false;

  RemedyAnalysis( this._remedyData, this._analyseMessage, this._remedyExistence );

  RemedyAnalysis.fromJson(var json){
    _remedyData = Remedy.fromRetrainJson(json);
    _analyseMessage = json['report']['analyze-message'];
    _remedyExistence = json['report']['new-remedy-exist'];
  }

  Remedy get remedyData => _remedyData;

  set remedyData(Remedy value) {
    _remedyData = value;
  }

  bool get remedyExistence => _remedyExistence;

  set remedyExistence(bool value) {
    _remedyExistence = value;
  }

  String get analyseMessage => _analyseMessage;

  set analyseMessage(String value) {
    _analyseMessage = value;
  }
}