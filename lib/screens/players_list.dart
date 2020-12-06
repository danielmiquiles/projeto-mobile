import 'package:flutter/material.dart';
import 'package:projeto_mobile/components/custom_card.dart';
import 'package:projeto_mobile/models/player.dart';
import 'package:projeto_mobile/models/drafts.dart';
import 'package:projeto_mobile/screens/cadastro_form.dart';
import 'package:projeto_mobile/components/alerts.dart';

import 'draw.dart';

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
          IconButton(
              icon: Icon(Icons.people),
              onPressed: () {
                if (widget._presentes.length < 10) {
                  //retorna uma alerta para se o usuário tentar escolher menos que 10 jogadores
                  showAlertDialog1(context);
                } else {
                  widget._presentes
                      .sort((a, b) => b.rating.compareTo(a.rating));
                  //drawTeams retorna uma lista com 10 nomes, do 0 ao 4 é o time 1 e do 5 ao 9 time 2
                  print(drawTeams(widget._presentes));
                }
                /* Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Draw(
                    players: widget._presentes,
                  ),
                ));*/
              }),
          Checkbox(
              value: widget.checked,
              onChanged: (value) {
                if (value) {
                  for (var player in widget._players) {
                    player.present = value;

                    setState(() {
                      widget.checked = value;
                      widget._presentes.add(player);
                    });
                  }
                } else {
                  for (var player in widget._players) {
                    player.present = value;

                    setState(() {
                      widget.checked = value;
                      widget._presentes.remove(player);
                    });
                  }
                }
              }),
        ],
      ),
      body: ListView.builder(
        itemCount: widget._players.length,
        itemBuilder: (context, index) {
          final player = widget._players[index];
          final rating = player.rating;
          return Card(
            child: ListTile(
              leading: Icon(Icons.people),
              title: Text(player.name),
              subtitle: Text('Mensal'),
              trailing: SizedBox(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('$rating'),
                    Checkbox(
                      value: player.present,
                      onChanged: (value) {
                        if (widget._presentes.length < 10) {
                          if (value) {
                            setState(() {
                              widget._presentes.add(player);
                            });
                            player.present = value;
                          } else {
                            setState(() {
                              widget._presentes.remove(player);
                            });

                            player.present = value;
                          }
                        } else {
                          if (value) {
                            showAlertDialog2(context);
                          } else {
                            setState(() {
                              widget._presentes.remove(player);
                            });

                            player.present = value;
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
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

Object drawTeams(List<Player> presentes) {
  List<int> draftOrder = [];
  List<String> sortedList = [];
  List drafts = [];
  drafts.add(Drafts(1, draftType1(presentes).abs()));
  drafts.add(Drafts(2, draftType2(presentes).abs()));
  drafts.add(Drafts(3, draftType3(presentes).abs()));
  drafts.add(Drafts(4, draftType4(presentes).abs()));
  //ordenando os tipos de sorteio para o que a diferença deu a mais próxima de 0
  drafts.sort((a, b) => a.rating.compareTo(b.rating));
  //colancando a ordem do draft com a menor diferença perto em um array
  draftOrder = draftOrder1(drafts.elementAt(0).rating);
  // return players;
  presentes.asMap().forEach((index, value) {
    sortedList.add(presentes.elementAt(draftOrder[index]).name.toString());
  });
  return sortedList;
}

//somando e subtraindo os times para obter a menor diferença possível
int draftType1(players) {
  var drawerRating = 0;
  drawerRating = (players.elementAt(0).rating +
          players.elementAt(3).rating +
          players.elementAt(4).rating +
          players.elementAt(7).rating +
          players.elementAt(9).rating) -
      (players.elementAt(1).rating +
          players.elementAt(2).rating +
          players.elementAt(5).rating +
          players.elementAt(6).rating +
          players.elementAt(8).rating);
  return drawerRating;
}

int draftType2(players) {
  var drawerRating = 0;
  drawerRating = (players.elementAt(0).rating +
          players.elementAt(2).rating +
          players.elementAt(4).rating +
          players.elementAt(6).rating +
          players.elementAt(8).rating) -
      (players.elementAt(1).rating +
          players.elementAt(3).rating +
          players.elementAt(5).rating +
          players.elementAt(7).rating +
          players.elementAt(9).rating);
  return drawerRating;
}

int draftType3(players) {
  var drawerRating = 0;
  drawerRating = (players.elementAt(0).rating +
          players.elementAt(4).rating +
          players.elementAt(5).rating +
          players.elementAt(6).rating +
          players.elementAt(7).rating) -
      (players.elementAt(1).rating +
          players.elementAt(2).rating +
          players.elementAt(3).rating +
          players.elementAt(8).rating +
          players.elementAt(9).rating);
  return drawerRating;
}

int draftType4(players) {
  var drawerRating = 0;
  drawerRating = (players.elementAt(0).rating +
          players.elementAt(1).rating +
          players.elementAt(7).rating +
          players.elementAt(8).rating +
          players.elementAt(9).rating) -
      (players.elementAt(2).rating +
          players.elementAt(3).rating +
          players.elementAt(4).rating +
          players.elementAt(5).rating +
          players.elementAt(6).rating);
  return drawerRating;
}

//colocando a ordem do menor draft possível num array;
List draftOrder1(draftStyle) {
  List<int> intList = [];
  if (draftStyle == 1) {
    intList = [0, 3, 4, 7, 9, 1, 2, 5, 6, 8];
  } else if (draftStyle == 2) {
    intList = [0, 2, 4, 6, 8, 1, 3, 5, 7, 9];
  } else if (draftStyle == 3) {
    intList = [0, 4, 5, 6, 7, 1, 2, 3, 8, 9];
  } else {
    intList = [0, 1, 7, 8, 9, 2, 3, 4, 5, 6];
  }
  return intList;
}
