class AnalysedImageDisease{
  String _diseaseName = '';
  String _matchingRate = '';

  AnalysedImageDisease();

  AnalysedImageDisease.initAll(this._diseaseName, this._matchingRate);

  AnalysedImageDisease.fromJson(var json){
    this._diseaseName = json['disease_name'];
    this._matchingRate = json['matching-rate'].toString();
  }

  // ignore: unnecessary_getters_setters
  String get matchingRate => _matchingRate;

  // ignore: unnecessary_getters_setters
  set matchingRate(String value) {
    _matchingRate = value;
  }

  // ignore: unnecessary_getters_setters
  String get diseaseName => _diseaseName;

  // ignore: unnecessary_getters_setters
  set diseaseName(String value) {
    _diseaseName = value;
  }
}