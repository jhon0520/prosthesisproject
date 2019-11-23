import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:protesisproyect/src/model/RegisterModel.dart';

export 'package:protesisproyect/src/model/RegisterModel.dart';

class RegisterProvider extends ChangeNotifier {
  
  RegisterModel _registerModel;
  http.Response _response;

  Future<bool> createUserAPI (String userName, String password, int hospitalId, String userType) async{

    String url = 'http://157.230.83.235:3000/api/createUser';

    dynamic jsonRequest = {
	    "userName" : userName,
	    "password" : password,
	    "hospitalId" : hospitalId.toString(),
	    "userType" : userType
    };

    _response = await http.post(url, body: jsonRequest);

    if(_response.statusCode != 200){
      if(_response.statusCode == 404){
        return json.decode(_response.body)['response'];
      }
    }

    _registerModel = registerModelFromJson(_response.body);

    return _registerModel.response;

  }


}