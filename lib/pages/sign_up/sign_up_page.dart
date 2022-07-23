// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gym_app/pages/login/login_page.dart';
import 'package:gym_app/pages/sign_up/sign_up_service.dart';
import 'package:gym_app/shared/constants/custom_colors.dart';
import 'package:gym_app/shared/constants/preferences_keys.dart';
import 'package:gym_app/shared/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  TextEditingController _confirmInputController = TextEditingController();
  bool showPassword = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColors().getGradientSecondaryColor(),
              CustomColors().getGradientMainColor(),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Image.asset(
                  'assets/dumbbell-semfundo.png',
                  height: 125,
                ),
              ),
              Text(
                'Cadastro',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameInputController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Nome Completo',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _mailInputController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _passwordInputController,
                      obscureText: (showPassword == true) ? false : true,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.vpn_key_sharp,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    (showPassword == false)
                        ? TextFormField(
                            controller: _confirmInputController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Confirme a Senha',
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.vpn_key_sharp,
                                color: Colors.white,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    Row(
                      children: [
                        Checkbox(
                          value: showPassword,
                          onChanged: (newValue) {
                            setState(() {
                              showPassword = newValue;
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                        Text(
                          'Mostrar Senha',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              RaisedButton(
                child: Text('Cadastrar'),
                color: CustomColors().getActiveSecondaryButton(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onPressed: () {
                  _doSignUp();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _doSignUp() {
    if (_formKey.currentState.validate()) {
      SignUpService().signUp(
        _mailInputController.text,
        _passwordInputController.text,
      );
    } else {
      Container(color: Colors.black);
    }
    // LoginModel newUser = LoginModel(
    //   name: _nameInputController.text,
    //   mail: _mailInputController.text,
    //   password: _passwordInputController.text,
    //   keepOn: true,
    // );

    // _saveUser(newUser);
  }

  void _saveUser(LoginModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(PreferencesKeys.activeUser, json.encode(user.toJson()));
  }
}
