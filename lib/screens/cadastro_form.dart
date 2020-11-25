import 'package:flutter/material.dart';
import 'package:projeto_mobile/components/custom_textField.dart';

class CadastroForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent[400],
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                label: 'Nome',
                controller: null,
                padding: 24.0,
              ),
              CustomTextField(
                label: 'Telefone',
                controller: null,
                padding: 24.0,
              ),
              CustomTextField(
                label: 'Posição',
                controller: null,
                padding: 24.0,
              ),
              CustomTextField(
                label: 'Idade',
                controller: null,
                padding: 24.0,
              ),
              CustomTextField(
                label: 'Email',
                controller: null,
                padding: 24.0,
              ),
              CustomTextField(
                label: 'User',
                controller: null,
                padding: 24.0,
              ),
              CustomTextField(
                label: 'Password',
                controller: null,
                padding: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 64.0),
                child: SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: RaisedButton(
                    color: Colors.black,
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
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
