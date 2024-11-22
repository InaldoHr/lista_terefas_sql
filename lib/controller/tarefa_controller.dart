import 'package:lista_terefas_sql/model/bd.dart';

class TarefaController {

  Future<void> adicionarTarefa(String titulo, String desc) async {
    await Bd.instance.adicionarTarefa(titulo, desc);
    print("Adicionado" + titulo + desc);
  }
  
  Future<void> deleteTarefa(int id) async{
    await Bd.instance.deleteTarefa(id);
    print("Tarefa deletada ID: ${id}");
  }

  Future<void> updateTarefa(int id, String titulo, String desc) async{
    await Bd.instance.updateTarefa(id, titulo, desc);
    print("Tarefa atualizada ID: ${id}");
  }

}