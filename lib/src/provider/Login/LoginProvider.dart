import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:protesisproyect/src/model/LoginModel.dart';

export 'package:protesisproyect/src/model/LoginModel.dart';

class LoginProvider extends ChangeNotifier {
  
  LoginModel _loginModel;
  http.Response _response;

  get getLoginModel => _loginModel;

  set setLoginModel(LoginModel newLoginModel){
    _loginModel = newLoginModel;
    notifyListeners();
  }

  Future<bool> validateUserAPI (String userName, String password) async{

    String url = 'http://157.230.83.235:3000/api/validateUser';
    dynamic jsonRequest = {
	    "userName": userName,
	    "password": password,
    };

    _response = await http.post(url, body: jsonRequest);

    if(_response.statusCode != 200){
      if(_response.statusCode == 404){
        return json.decode(_response.body)['response'];
      }
    }

    _loginModel = loginModelFromJson(_response.body);

    return _loginModel.response;

  }


}