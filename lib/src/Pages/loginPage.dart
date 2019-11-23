import 'package:flutter/material.dart';
import 'package:protesisproyect/src/provider/Login/LoginProvider.dart';
import 'package:protesisproyect/src/utils/alert.dart';
import 'package:provider/provider.dart';


String userName;
String password;

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SafeArea(
            child: Container(),
          ),
            _imageLogin(size),
            Text('HUV', style: TextStyle(fontSize: 40, color: Colors.lightBlue),),
            SizedBox(height: 20.0),
            _userTextField(),
            SizedBox(height: 20.0),
            _passwordTextField(),
            SizedBox(height: 20.0),
            _loginButton(context, loginProvider),
          ],
        ),
      ),
    );
  }

  Widget _imageLogin(Size size){
    return Container(
      child: Image.asset('assets/img/HUV.jpg', 	
      height: size.height/4,
      width: size.width/2,
      )
    );
  }

  Widget _userTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => userName=value,
        style: TextStyle(
            color: Colors.lightBlue),
        decoration: InputDecoration(
          icon: Icon(Icons.account_circle,
              color: Colors.lightBlue,
              size: 50.0),
          hintText: 'ejemplo@correo.com',
          labelText: 'Usuario',
          counterText: 'Usuario',
          counterStyle: TextStyle(
              color: Colors.lightBlue),
          labelStyle: TextStyle(
              color: Colors.lightBlue),
          hintStyle: TextStyle(
              color: Colors.lightBlue),
          //Cambio de color cuando la barra inferior del TextField no esta seleccionada
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.lightBlue,
                  style: BorderStyle.solid)),
          //Cambio de color cuando la barra inferior del TextField esta seleccionada
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.lightBlue,
                  style: BorderStyle.solid)),
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        onChanged: (value) => password=value,
        // cursorColor: ,
        style: TextStyle(
            color: Colors.lightBlue),
        decoration: InputDecoration(
          icon: Icon(Icons.lock_outline,
              color: Colors.lightBlue,
              size: 50.0),
          hintText: '******',
          labelText: 'Contraseña',
          counterText: 'Contraseña',
          counterStyle: TextStyle(
              color: Colors.lightBlue),
          labelStyle: TextStyle(
              color: Colors.lightBlue),
          hintStyle: TextStyle(
              color: Colors.lightBlue),

          //Cambio de color cuando la barra inferior del TextField no esta seleccionada
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white,
                  style: BorderStyle.solid)),
          //Cambio de color cuando la barra inferior del TextField esta seleccionada
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white,
                  style: BorderStyle.solid)),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context, LoginProvider loginProvider) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 50.0,),
        onPressed: ()async {

          try {
            bool response = await loginProvider.validateUserAPI(userName, password);

              if(response){
              LoginModel userModel = loginProvider.getLoginModel;
                if (userModel.content.userType == 'Administrator') {
                  Navigator.pushNamed(context, 'register');
                } else{
                  Navigator.pushReplacementNamed(context, 'questionnaire');
                }
              }else{
                 showAlert(context, 'Login', 'Credenciales ingresadas incorrectas');
              }

          } catch (e) {
            print(e);
            showAlert(context, 'Login', 'En estos momentos presentamos problemas con la red.');
          }
        },
        child: Text('Ingresar',
              style: TextStyle(color: Colors.white,
              fontSize: 20)
        ),
      ),
    );
  }

}