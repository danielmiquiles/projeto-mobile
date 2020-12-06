import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/player.dart';

class Draw extends StatelessWidget {
  List<String> players = List();
  

  Draw({this.players});


  



  @override
  Widget build(BuildContext context) {

    List<String> time1 = List();
    List<String> time2 = List();

    for (var i = 0; i < players.length; i++) {

      if(i < 5){

        time1.add(players[i]);

      } else {
        time2.add(players[i]);
      }
    
    }



    return Scaffold(
        backgroundColor: Colors.greenAccent[700],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Sorteio dos Times',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: time1.map((name) {
                  return Text(name, style: TextStyle(fontSize: 30),);
                }).toList(),
              ),
              Padding(padding: EdgeInsets.all(24.0)),
              Text('X', style: TextStyle(fontSize: 30),),
              Padding(padding: EdgeInsets.all(24.0)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: time2.map((name) {
                  return Text(name, style: TextStyle(fontSize: 30),);
                }).toList(),
              ),
              
            ],
          ),
        )
      );
  }
}



