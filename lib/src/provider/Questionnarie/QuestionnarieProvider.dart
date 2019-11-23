import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class QuestionnarieProvider extends ChangeNotifier {
  int _personalID = 0;
  int _age = 0;
  String _gender = "";
  String _departament = "";
  String _housingArea = "";
  String _amputationType = "";
  String _classification = "";
  String _zone = "";
  String _prosthesisType = "";
  String _activityLevel = "";
  String _time = "";
  String _question1 = "";
  String _question2 = "";

  get getPersonalID => _personalID;
  get getAge => _age;
  get getGender => _gender;
  get getDepartament => _departament;
  get getHousingArea => _housingArea;
  get getAmputationType => _amputationType;
  get getClassification => _classification;
  get getZone => _zone;
  get getProsthesisType => _prosthesisType;
  get getActivityLevel => _activityLevel;
  get getTime => _time;
  get getQuestion1 => _question1;
  get getQuestion2 => _question2;

  set setPersonalID(int newPersonalID) {
    _personalID = newPersonalID;
    notifyListeners();
  }

  set setAge(int newAge) {
    _age = newAge;
    notifyListeners();
  }

  set setGender(String newGender) {
    _gender = newGender;
    notifyListeners();
  }

  set setDepartament(String newDepartament) {
    _departament = newDepartament;
    notifyListeners();
  }

  set setHousingArea(String newHousingArea) {
    _housingArea = newHousingArea;
    notifyListeners();
  }

  set setAmputationType(String newAmputationType) {
    _amputationType = newAmputationType;
    notifyListeners();
  }

  set setClassification(String newClassification) {
    _classification = newClassification;
    notifyListeners();
  }

  set setZone(String newZone) {
    _zone = newZone;
    notifyListeners();
  }

  set setProsthesisType(String newProsthesisType) {
    _prosthesisType = newProsthesisType;
    notifyListeners();
  }

  set setActivityLevel(String newActivityLevel) {
    _activityLevel = newActivityLevel;
    notifyListeners();
  }

  set setTime(String newTime) {
    _time = newTime;
    notifyListeners();
  }

  set setQuestion1(String newQuestion1) {
    _question1 = newQuestion1;
    notifyListeners();
  }

  set setQuestion2(String newQuestion2) {
    _question2 = newQuestion2;
    notifyListeners();
  }

  Future<bool> createQuestionnaireAPI(
      int personalID,
      int age,
      String gender,
      String departament,
      String housingArea,
      String amputationType,
      String classification,
      String zone,
      String prosthesisType,
      String activityLevel,
      String time,
      String question1,
      String question2) async {

        String url = 'http://157.230.83.235:3000/api/createQuestionnaire';

        dynamic jsonRequest = {
	        "personalID" : personalID,
          "age" : age,
          "gender" : gender,
          "departament" : departament,
          "housingArea" : housingArea,
          "amputationType" : amputationType,
          "classification" : classification,
          "zone" : zone,
          "prosthesisType" : prosthesisType,
          "activityLevel" : activityLevel,
          "time" : time,
          "question1" : question1,
          "question2" : question2
        };



      }
}
