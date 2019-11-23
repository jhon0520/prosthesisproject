import 'package:flutter/material.dart';
import 'package:protesisproyect/src/Pages/QuestionnairePage.dart';
import 'package:protesisproyect/src/Pages/RegisterPage.dart';

import 'package:protesisproyect/src/Pages/loginPage.dart';
import 'package:protesisproyect/src/provider/Login/LoginProvider.dart';
import 'package:protesisproyect/src/provider/Questionnarie/QuestionnarieProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        
        ChangeNotifierProvider(
          builder: (_) => LoginProvider()
        ),
        ChangeNotifierProvider(
          builder:  (_) => QuestionnarieProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'biciapps App',
        initialRoute: 'login',
        routes: {          
          'login' : (context) => LoginPage(),
          'register' : (context) => RegisterPage(),
          'questionnaire' : (context) => QuestionnairePage(),
        },
      ),
    );
  }
}
