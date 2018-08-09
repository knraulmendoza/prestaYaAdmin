import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
            // key: formKey,
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
                          // onSaved: (value) => _user = value,
                          decoration: InputDecoration(labelText: 'Usuario' , labelStyle: TextStyle(color: Colors.white)),
                          // validator: validation.validateEmail
                        ),
                        TextFormField(
                          // onSaved: (value) => _pass = value,
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
                            // validarForm();
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
                          onPressed: (){},
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