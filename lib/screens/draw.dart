import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/player.dart';

class Draw  extends StatelessWidget {

  List<Player> players = List();

  Draw({this.players});

  @override
  Widget build(BuildContext context) {
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
        width: double.maxFinite,
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(
              height: 100,
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: RaisedButton(
                  child: Text('Sortear', style: TextStyle(fontSize: 26),), 
                  onPressed: (){

                    print(players);

          },),
              ),
            ),

          ],
        
          
        ),
      )
    );
  }
}