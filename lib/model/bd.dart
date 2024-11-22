import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';



class Bd {
  static Database? _database;

  // Singleton para garantir que uma única instância do banco seja usada
  static final Bd instance = Bd._privateConstructor();
  Bd._privateConstructor();

  // Método para obter a instância do banco de dados
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _inicializaBd();
    return _database!;
  }






  Future<Database> _inicializaBd() async {
    final databasePath = await getApplicationSupportDirectory(); // Usando o diretório de suporte
    final path = join(databasePath.path, 'atividade.db');

    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tarefas(id INTEGER PRIMARY KEY, titulo_tarefas TEXT, desc_tarefas TEXT)',
        );
      },
      version: 1,
    );
  }




  // Inserir Dados
  Future<void> adicionarTarefa(String titulo, String desc) async {
    final db = await database; // Obtém a instância do banco
    await db.insert(
      'tarefas', 
      {'titulo_tarefas': titulo, 'desc_tarefas': desc},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Consultar Dados
  Future<List<Map<String, dynamic>>> getTarefas() async {
    final db = await database; // Obtém a instância do banco
    return await db.query('tarefas');
  }

  // Atualizar Dados
  Future<void> updateTarefa(int id, String titulo, String desc) async {
    final db = await database; // Obtém a instância do banco
    await db.update(
      'tarefas',
      {'titulo_tarefas': titulo, 'desc_tarefas': desc},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Deletar Dados

  Future<void> deleteTarefa(int id) async {
    final db = await database; // Obtém a instância do banco
    await db.delete(
      
      'tarefas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Future<void> _loadTarefas() async {
  //   final pedidoList = await Bd.instance.getTarefas(),
  //   setState
  // }
}
