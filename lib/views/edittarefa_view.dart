import 'package:flutter/material.dart';
import 'package:lista_terefas_sql/controller/tarefa_controller.dart';

class EdittarefaView extends StatefulWidget {
  const EdittarefaView({super.key, required this.id});
  final int id;

  @override
  State<EdittarefaView> createState() => _EdittarefaViewState();
}

class _EdittarefaViewState extends State<EdittarefaView> {
  @override

  TarefaController controller = TarefaController();
  TextEditingController tituloController = TextEditingController();
  TextEditingController descController = TextEditingController();
  

  Widget build(BuildContext context) {

    

    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Tarefa"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 9, 121, 177),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Adicionar Tarefa",
                style: TextStyle(
                  fontSize: 25,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tituloController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: 'Titulo',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: descController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: 'descrição',
                ),
              ),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  controller .adicionarTarefa(
                    tituloController.text, 
                    descController.text
                  );
                  Navigator.of(context).pushReplacementNamed('/');                  
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 9, 121, 177)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                icon: const Icon(Icons.send),
                label: Text('Enviar'))
          ],
        ),
      ),
    );
  }
}
