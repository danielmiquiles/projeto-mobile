// import 'dart:math';
// import 'package:path/path.dart';
// import 'package:projeto_mobile/models/user.dart';
// import 'package:sqflite/sqflite.dart';

const String CREATE_CONTACTS_TABLE_SCRIPT = 'CREATE TABLE user('
    'id INTEGER PRIMARY KEY AUTOINCREMENT, '
    'nome TEXT,  '
    'telefone TEXT, '
    'posicao TEXT, '
    'idade INTERGER, '
    'email TEXT, '
    'user TEXT, '
    'password TEXT)';

const String TABLE_NAME = 'user';
const DATABASE_NAME = 'peladapp';

// Future<Database> _getDatabase() async {
//   return openDatabase(
//     join(await getDatabasesPath(), DATABASE_NAME),
//     onCreate: (db, version) {
//       return db.execute(CREATE_CONTACTS_TABLE_SCRIPT);
//     },
//     version: 1,
//   );
// }

// Future create(UserModel user) async {
//   try {
//     final Database db = await _getDatabase();

//     await db.insert(
//       TABLE_NAME,
//       user.toMap(),
//     );
//   } catch (ex) {
//     print(ex);
//     return;
//   }
// }

// Future<Database> createDatabase() {
//   return getDatabasesPath().then((dbPath) {
//     final path = join(dbPath, 'peladapp.db');
//     return openDatabase(
//       path,
//       onCreate: (db, version) {
//         db.execute(CREATE_CONTACTS_TABLE_SCRIPT);
//       },
//       version: 2,
//     );
//   });
// }

// Future<int> save(UserModel usuario) {
//   return createDatabase().then((db) {
//     final Map<String, dynamic> userMap = Map();

//     userMap['nome'] = usuario.nome;
//     userMap['telefone'] = usuario.telefone;
//     userMap['posicao'] = usuario.posicao;
//     userMap['idade'] = usuario.idade;
//     userMap['email'] = usuario.email;
//     userMap['user'] = usuario.user;
//     userMap['password'] = usuario.password;

//     return db.insert('user', userMap);
//   });
// }

// Future<List<UserModel>> findAll() {
//   return createDatabase().then((db) {
//     return db.query('user').then((maps) {
//       final List<UserModel> usuarios = List();
//       for (Map<String, dynamic> map in maps) {
//         final UserModel usuario = UserModel(
//           id: map['id'],
//           nome: map['nome'],
//           telefone: map['telefone'],
//           posicao: map['posicao'],
//           idade: map['idade'],
//           email: map['email'],
//           user: map['user'],
//           password: map['password'],
//         );
//         usuarios.add(usuario);
//       }
//       return usuarios;
//     });
//   });
// }
