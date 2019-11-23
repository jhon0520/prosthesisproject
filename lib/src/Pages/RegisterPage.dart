import 'package:flutter/material.dart';
import 'package:protesisproyect/src/provider/Register/RegisterProvider.dart';
import 'package:protesisproyect/src/utils/alert.dart';

String userName, password, userType;
int hospitalId;

String dropdownType = 'Tipo de usuario';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(),
            ),
            SizedBox(
              height: 40,
            ),
            _userNameTextField(),
            _passwordTextField(),
            _hospitalIDTextField(),
            _userTypeDropDown(),
            _registerButton(),
          ],
        ),
      ),
    );
  }

  Widget _userNameTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => userName = value,
        style: TextStyle(color: Colors.lightBlue),
        decoration: InputDecoration(
          icon: Icon(Icons.account_circle, color: Colors.lightBlue, size: 50.0),
          hintText: 'usuariodeejemplo',
          labelText: 'Usuario',
          counterText: 'Usuario',
          counterStyle: TextStyle(color: Colors.lightBlue),
          labelStyle: TextStyle(color: Colors.lightBlue),
          hintStyle: TextStyle(color: Colors.lightBlue),
          //Cambio de color cuando la barra inferior del TextField no esta seleccionada
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.lightBlue, style: BorderStyle.solid)),
          //Cambio de color cuando la barra inferior del TextField esta seleccionada
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.lightBlue, style: BorderStyle.solid)),
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.text,
        onChanged: (value) => password = value,
        style: TextStyle(color: Colors.lightBlue),
        decoration: InputDecoration(
          icon: Icon(Icons.lock_outline, color: Colors.lightBlue, size: 50.0),
          hintText: '********',
          labelText: 'Contraseña',
          counterText: 'Contraseña',
          counterStyle: TextStyle(color: Colors.lightBlue),
          labelStyle: TextStyle(color: Colors.lightBlue),
          hintStyle: TextStyle(color: Colors.lightBlue),
          //Cambio de color cuando la barra inferior del TextField no esta seleccionada
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.lightBlue, style: BorderStyle.solid)),
          //Cambio de color cuando la barra inferior del TextField esta seleccionada
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.lightBlue, style: BorderStyle.solid)),
        ),
      ),
    );
  }

  Widget _hospitalIDTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: (value) => hospitalId = int.parse(value),
        style: TextStyle(color: Colors.lightBlue),
        decoration: InputDecoration(
          icon: Icon(Icons.local_hospital, color: Colors.lightBlue, size: 50.0),
          hintText: '42587961',
          labelText: 'ID del Hospital',
          counterText: 'ID del Hospital',
          counterStyle: TextStyle(color: Colors.lightBlue),
          labelStyle: TextStyle(color: Colors.lightBlue),
          hintStyle: TextStyle(color: Colors.lightBlue),
          //Cambio de color cuando la barra inferior del TextField no esta seleccionada
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.lightBlue, style: BorderStyle.solid)),
          //Cambio de color cuando la barra inferior del TextField esta seleccionada
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.lightBlue, style: BorderStyle.solid)),
        ),
      ),
    );
  }

  Widget _userTypeDropDown() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.90,
      child: Center(
              child: DropdownButton<String>(
          value: dropdownType,
          elevation: 16,
          style: TextStyle(color: Colors.lightBlue, fontSize: 18),
          iconEnabledColor: Colors.lightBlue,
          underline: Container(
            height: 2,
            color: Colors.white,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownType = newValue;
              userType = newValue;
            });
          },
          items: <String>['Tipo de usuario', 'Deafault', 'Administrator']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 50.0,),
        onPressed: ()async {

          try {
            
            RegisterProvider registerProvider = new RegisterProvider();

            bool response = await registerProvider.createUserAPI(userName, password, hospitalId, userType);

              if(response){
              showAlert(context, 'Registro de usuario', 'Usuario registrado con exito.');
              }else{
                showAlert(context, 'Registro de usuario', 'En estos momentos presentamos problemas con la red.');
              }

          } catch (e) {
            print(e);
            showAlert(context, 'Registro de usuario', 'En estos momentos presentamos problemas con la red.');
          }
        },
        child: Text('Registro',
              style: TextStyle(color: Colors.white,
              fontSize: 20)
        ),
      ),
    );
  }

}