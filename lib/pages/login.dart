import 'package:flutter/material.dart';
import '../validators/validation.dart';
import 'package:flutter_toast/flutter_toast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = new GlobalKey<FormState>();
  String _user = '';
  String _pass = '';
  Validations validation = new Validations();
  void validarForm(){
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      print('Es valido $_user y $_pass');
    } else {
      print('No es valido');
    }
  }
  toastMensaje(String msg){
    // Fluttertoast.showToast(
    //   msg: msg,
    //   gravity: ToastGravity.BOTTOM
    // );
    FlutterToast.showToast(msg);
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.lightGreen,
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
              image: AssetImage('assets/images/splash.png'),
              fit: BoxFit.cover,
            )
          ),
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 70.0),
                    alignment: Alignment.center,
                    child: new Column(
                      children: <Widget>[
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              'Presta',
                              style: TextStyle(color: Colors.white, fontSize: 35.0),
                            ),
                            new Text(
                              'YA',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        new Text('Administrador',style: TextStyle(color: Colors.white, fontSize: 15.0),),
                        new Divider(color: Colors.white,)
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 90.0, bottom: 10.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          onSaved: (value) => _user = value,
                          decoration: InputDecoration(labelText: 'Usuario' , labelStyle: TextStyle(color: Colors.white)),
                          validator: validation.validateEmail
                          
                        ),
                        TextFormField(
                          onSaved: (value) => _pass = value,
                          obscureText: true,
                          decoration: InputDecoration(labelText: 'Contraseña', labelStyle: TextStyle(color: Colors.white)),
                          validator: (val) =>
                            val.length < 6 ? 'Password too short.' : null,
                          
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RaisedButton(
                          child: Text('Login'),
                          textColor: Colors.green,
                          color: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)
                          ),
                          onPressed: () {
                            toastMensaje('Ingresa el usuario');
                            validarForm();
                            // auth.logueo(_user, _pass)
                            // .then((user) {
                            //   print('welcome ${user.email}');
                            //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Principal()));
                            // }).catchError((err) => print(err));
                          },
                        ),
                        new FlatButton(
                          child: new Text('¿Olvido su contraseña?'),
                          textColor: Colors.white,
                          onPressed: () {
                            formKey.currentState.save();
                            print(_user);
                            if (_user.isEmpty) {
                              print('Ingresa el usuario');
                              toastMensaje('Ingresa el usuario');
                            }else{
                              print('Verifique su correo electronico');
                              toastMensaje('Verifique su correo electronico');
                            }
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              ),
            ),
          ),
        ),
      );
    }
}