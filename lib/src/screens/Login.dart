import 'package:flutter/material.dart';
import '../blocs/LoginBloc.dart';
import '../blocs/Provider.dart';
import '../utils/config.dart';
import 'dart:convert';
import '../models/login_model.dart';
import '../models/error_model.dart';
import '../networks/api_connect.dart';
import "./HomePage.dart";
import '../utils/preferences.dart';
import '../utils/commons.dart';

void main() {
  runApp(MaterialApp(
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginModel model;
  ErrorModel errModel;
  bool _secureText = true;
  bool _isLoading = false;

  _showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Image.asset('assets/login.png'),
            emailField(bloc),
            passwordField(bloc),
            Container(
              margin: EdgeInsets.only(top: 20.0),
            ),
            submitButton(bloc),
            showLoading()
          ],
        ),
      ),
    );
  }

  Widget emailField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'you@examples.com',
              labelText: 'Email Adress',
              errorText: snapshot.error),
        );
      },
    );
  }

  Widget passwordField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          obscureText: _secureText,
          onChanged: bloc.changePassword,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              suffixIcon: IconButton(
                onPressed: _showHide,
                icon:
                    Icon(_secureText ? Icons.visibility_off : Icons.visibility),
              ),
              errorText: snapshot.error),
        );
      },
    );
  }

  Widget submitButton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          color: Colors.red,
          onPressed: snapshot.hasData
              ? () {
                  login(bloc, context);
                }
              : null,
          child: Text(
            'Masuk',
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  Widget showLoading() {
    return _isLoading
        ? Container(child: Center(child: CircularProgressIndicator()))
        : Container();
  }

  login(LoginBloc bloc, BuildContext context) {
    setState(() {
      this._isLoading = true;
    });
    var queryParameters = {
      'email': bloc.getEmail,
      'password': bloc.getPassword,
    };

    ApiConnect().postRequest(queryParameters, Config.loginLink)
        // .then((response) => print(json.decode(response.body.toString())));
        .then((response) {
      if (response.statusCode == 200) {
        model = LoginModel.fromJson(json.decode(response.body));
        setString(Config.vid, model.vid);
        setString(Config.name, Commons().toUpperCase(model.vnama1) + ' ' + Commons().toUpperCase(model.vnama2));
        setString(Config.email, model.vemail);
        setString(Config.phoneNumber, model.vcodenegara + model.vphone);
        getString(Config.vid).then((onValue) {
          print(onValue);
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      } else {
        errModel = ErrorModel.fromJson(json.decode(response.body));
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text(errModel.responseDesc)));
      }
      setState(() {
        this._isLoading = false;
      });
    });
  }
}
