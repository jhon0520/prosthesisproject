import 'package:flutter/material.dart';

import 'package:protesisproyect/src/Pages/loginPage.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // SwitchButtom Provider
        // ChangeNotifierProvider(
        //   builder: (_) => SwitchAppbarProvider()
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'biciapps App',
        initialRoute: 'login',
        routes: {          
          'login' : (context) => LoginPage(),
        },
      ),
    );
  }
}
