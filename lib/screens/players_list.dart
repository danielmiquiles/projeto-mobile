import 'package:flutter/material.dart';
import 'package:projeto_mobile/components/custom_card.dart';
import 'package:projeto_mobile/models/player.dart';
import 'package:projeto_mobile/screens/cadastro_form.dart';

class PlayersList extends StatefulWidget {
  List<Player> _players = [
    Player('Daniel', 3),
    Player('Renato', 4),
    Player('Márcio', 2),
    Player('Júlio', 4),
    Player('Jeremias', 3),
    Player('Eduardo', 5),
    Player('Tiago', 3),
    Player('Paulo', 2),
    Player('Luiz', 3),
    Player('Guilherme', 2),
    Player('André', 5),
  ];

  List<Player> _presentes = [];
  bool checked = false;

  @override
  _PlayersListState createState() => _PlayersListState();
}

class _PlayersListState extends State<PlayersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[700],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Lista de Jogadores',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(icon: Icon(Icons.people), onPressed: () {}),
          Checkbox(
              value: widget.checked,
              onChanged: (value) {
                setState(() {
                  widget.checked = value;
                });
              }),
        ],
      ),
      body: ListView.builder(
        itemCount: widget._players.length,
        itemBuilder: (context, index) {
          final player = widget._players[index];
          return CustomCard(player.name, player.rating);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          final Future<Player> future =
              Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return CadastroForm();
            },
          ));
          future.then((playerCriado) {
            if (playerCriado != null) {
              setState(() {
                widget._players.add(playerCriado);
              });
            }
            print(widget._players);
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.greenAccent[700],
        ),
      ),
    );
  }
}
