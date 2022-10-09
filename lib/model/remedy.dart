class Remedy{
  String _diseaseName = "";
  String _remedyTitle = "";
  String _remedyBrief = "";
  List<String> _remedySteps = [];

  Remedy(this._diseaseName, this._remedyTitle, this._remedyBrief, this._remedySteps );
  Remedy.fromJson(var json){
    _diseaseName = json['report']['disease-name'];
    _remedyTitle = json['report']['new-remedy-title'];
    _remedyBrief = json['report']['new-remedy-intro'];
    _remedySteps = [json['report']['new-remedy-steps']];
  }

  List<String> get remedySteps => _remedySteps;

  set remedySteps(List<String> value) {
    _remedySteps = value;
  }

  String get remedyBrief => _remedyBrief;

  set remedyBrief(String value) {
    _remedyBrief = value;
  }

  String get remedyTitle => _remedyTitle;

  set remedyTitle(String value) {
    _remedyTitle = value;
  }

  String get diseaseName => _diseaseName;

  set diseaseName(String value) {
    _diseaseName = value;
  }
}