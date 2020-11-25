import 'package:flutter/material.dart';

class UserModel {
  final int id;
  final String nome;
  final String telefone;
  final String posicao;
  final int idade;
  final String email;
  final String user;
  final String password;

  UserModel({
    this.id,
    this.nome,
    this.telefone,
    this.posicao,
    this.idade,
    @required this.email,
    @required this.user,
    @required this.password,
  });

  @override
  String toString() {
    // TODO: implement toString
    return 'User {$id, $nome, $password}';
  }
}
