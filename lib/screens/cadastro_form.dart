import 'package:flutter/material.dart';
import 'package:projeto_mobile/components/custom_textField.dart';
import 'package:projeto_mobile/models/player.dart';

class CadastroForm extends StatefulWidget {
  @override
  _CadastroFormState createState() => _CadastroFormState();
}

class _CadastroFormState extends State<CadastroForm> {
  List<String> _locations = ['1', '2', '3', '4', '5']; // Option 2
  String _selectedLocation; // Option 2
  TextEditingController inputNome = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent[700],
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                label: 'Nome',
                controller: inputNome,
                padding: 24.0,
              ),
              SizedBox(
                width: double.maxFinite,
                child: DropdownButton(
                  hint: Text('Selecione o rating do jogador'),
                  value: _selectedLocation,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedLocation = newValue;
                    });
                  },
                  items: _locations.map((location) {
                    return DropdownMenuItem(
                      child: new Text(location),
                      value: location,
                    );
                  }).toList(),
                ),
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
                    onPressed: () {
                      String nome = inputNome.text;
                      int rating = int.tryParse(_selectedLocation);

                      if (nome != null && rating != null) {
                        final playerCriado = Player(nome, rating);
                        Navigator.pop(context, playerCriado);
                      }
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
