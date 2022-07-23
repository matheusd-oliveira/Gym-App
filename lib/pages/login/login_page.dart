// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, curly_braces_in_flow_control_structures, missing_return

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gym_app/pages/login/login_service.dart';
import 'package:gym_app/pages/sign_up/sign_up_page.dart';
import 'package:gym_app/shared/constants/custom_colors.dart';
import 'package:gym_app/shared/constants/preferences_keys.dart';
import 'package:gym_app/shared/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;

  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              CustomColors().getGradientMainColor(),
              CustomColors().getGradientSecondaryColor(),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                'Entrar',
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
                      validator: (value) {
                        if (value.length < 5)
                          return 'Esse e-mail é muito curto';
                        else if (!value.contains('@'))
                          return 'Cadê o @ do seu e-mail ?';
                        return null;
                      },
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
                      validator: (value) {
                        if (value.length < 6)
                          return 'A senha deve ter pelo menos 6 caracters';
                        return null;
                      },
                      obscureText: _obscurePassword,
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
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Esqueceu a senha?',
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                children: [
                  Checkbox(
                    value: _obscurePassword,
                    onChanged: (newValue) {
                      setState(() {
                        _obscurePassword = newValue;
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
              ElevatedButton(
                child: Text('Login', style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    CustomColors().getActivePrimaryButtonColor(),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                onPressed: () {
                  _doLogin();
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Text(
                'Ainda não tem uma conta?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: RaisedButton(
                  child: Text('Cadastre-se'),
                  color: CustomColors().getActiveSecondaryButton(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _doLogin() async {
    if (_formKey.currentState.validate()) {
      LoginService().login(
        _mailInputController.text,
        _passwordInputController.text,
      );
    }
  }
}

  //   String mailForm = this._mailInputController.text;
  //   String passForm = this._passwordInputController.text;

  //   LoginModel savedUser = await _getSavedUser();

  //   if (mailForm == savedUser.mail && passForm == savedUser.password) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Login Efetuado com Sucesso')),
  //     );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Dados Incorretos')),
  //     );
  //   }
  // }

  // Future<LoginModel> _getSavedUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   String jsonUser = prefs.getString(PreferencesKeys.activeUser);

  //   Map<String, dynamic> mapUser = json.decode(jsonUser);
  //   LoginModel user = LoginModel.fromJson(mapUser);
  //   return user;
  // }
