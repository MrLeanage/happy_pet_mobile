import 'dart:collection';

import 'package:happy_pet/model/imageAnalysis/analysedImageDisease.dart';

class ImageAnalysis{
  List<AnalysedImageDisease> _analysedImageDisease = [];
  int _analysedImageCount = 0;
  String _analysisStatus = 'false';


  ImageAnalysis();
  ImageAnalysis.initAll(
      this._analysedImageDisease, this._analysedImageCount, this._analysisStatus);

  ImageAnalysis.fromJson(var json){

    List <dynamic> dynamicList =  ((json['analysis'] ?? []) as List);
    dynamicList.forEach((element) {
      this._analysedImageDisease.add(new AnalysedImageDisease.fromJson(element));
    });

    // this.analysedImageDisease = json['response']['analysis'];
    this._analysedImageCount = json['analyzed-image-count'];
    this._analysisStatus = json['status'];
  }

  // ignore: unnecessary_getters_setters
  String get analysisStatus => _analysisStatus;

  // ignore: unnecessary_getters_setters
  set analysisStatus(String value) {
    _analysisStatus = value;
  }

  // ignore: unnecessary_getters_setters
  int get analysedImageCount => _analysedImageCount;

  // ignore: unnecessary_getters_setters
  set analysedImageCount(int value) {
    _analysedImageCount = value;
  }

  // ignore: unnecessary_getters_setters
  List<AnalysedImageDisease> get analysedImageDisease => _analysedImageDisease;

  // ignore: unnecessary_getters_setters
  set analysedImageDisease(List<AnalysedImageDisease> value) {
    _analysedImageDisease = value;
  }
}