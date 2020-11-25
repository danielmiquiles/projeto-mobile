import 'package:flutter/material.dart';
import 'package:projeto_mobile/components/custom_textField.dart';
import 'package:projeto_mobile/models/user.dart';

import 'cadastro_form.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent[400],
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'PeladAPP',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontFamily: '',
                    fontSize: 36,
                  ),
                ),
              ),
              CustomTextField(
                label: 'User',
                padding: 16.0,
                controller: _userController,
              ),
              CustomTextField(
                label: 'Password',
                padding: 24.0,
                controller: _passwordController,
                hidden: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 36.0),
                child: SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: RaisedButton(
                    color: Colors.black,
                    child: Text(
                      'Entrar',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      final String login = _userController.text;
                      final String password = _passwordController.text;

                      sorteio();

                      // final User user = User(1, login, password);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 44.0),
                child: SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: RaisedButton(
                    color: Colors.black,
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return CadastroForm();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
