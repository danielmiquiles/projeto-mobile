import 'package:flutter/material.dart';
import 'screens/players_list.dart';

void main() {
  runApp(MyApp());
  // save(
  //   UserModel(
  //     nome: 'daniel',
  //     idade: 24,
  //     posicao: 'meia',
  //     telefone: '123456789',
  //     user: 'daniel',
  //     email: 'daniel@gmail.com',
  //     password: '1234',
  //   ),
  // ).then((value) => findAll().then((users) => debugPrint(users.toString())));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PlayersList(),
    );
  }
}
